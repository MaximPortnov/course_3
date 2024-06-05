package com.jeka.smartcontrol.service

import android.accessibilityservice.AccessibilityService
import android.annotation.SuppressLint
import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.content.res.Resources
import android.graphics.PixelFormat
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.WindowManager
import android.view.accessibility.AccessibilityEvent
import android.widget.ImageButton
import android.widget.LinearLayout
import android.widget.Toast
import androidx.camera.core.AspectRatio
import androidx.camera.core.Camera
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleService
import com.google.mediapipe.examples.handlandmarker.HandLandmarkerHelper
import com.google.mediapipe.examples.handlandmarker.HandLandmarkerHelper.Companion.TAG
import com.google.mediapipe.tasks.vision.core.RunningMode
import com.google.mediapipe.tasks.vision.handlandmarker.HandLandmarkerResult
import com.jeka.smartcontrol.R
import com.jeka.smartcontrol.SingleTonGovna
import com.jeka.smartcontrol.activity.MainViewModel
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors


class OverlayService : LifecycleService(), HandLandmarkerHelper.LandmarkerListener {

    private var screenHeight: Int = 0
    private var screenWidth: Int = 0
    private lateinit var overlayButton: LinearLayout
    private lateinit var windowManager: WindowManager
    private lateinit var params: WindowManager.LayoutParams

    private var preview: Preview? = null
    private var imageAnalyzer: ImageAnalysis? = null
    private var camera: Camera? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var cameraFacing = CameraSelector.LENS_FACING_FRONT
    private lateinit var handLandmarkerHelper: HandLandmarkerHelper

    private lateinit var backgroundExecutor: ExecutorService
//    override fun onBind(intent: Intent): IBinder? {
//        TODO("Not yet implemented")
//    }


    @SuppressLint("ForegroundServiceType")
    override fun onCreate() {
        super.onCreate()

        Toast.makeText(this, "Service Created", Toast.LENGTH_SHORT).show()
        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        overlayButton = LinearLayout(this)
        overlayButton.setBackgroundResource(R.drawable.circle_svgrepo_com)
        overlayButton.setOnClickListener {
            this.onDestroy()
        }
        val layoutFlag = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
        params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            layoutFlag,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        )
        params.gravity = Gravity.TOP or Gravity.START
        windowManager.addView(overlayButton, params)
        screenWidth = Resources.getSystem().displayMetrics.widthPixels
        screenHeight = Resources.getSystem().displayMetrics.heightPixels


        backgroundExecutor = Executors.newSingleThreadExecutor()
//        binding.previewCamera.post(::setUpCamera)
        setUpCamera()
        backgroundExecutor.execute(::setupHandLandMarkerHelper)

//        SingleTonGovna.instance.setListenerGovna(object : SingleTonGovna.ListenerGovna {
//            override fun onGovnoChanged(govno: HandLandmarkerResult?) {
//                govno?.let { handLandmarkerResult ->
//                    for(landmark in handLandmarkerResult.landmarks()) {
//                        Log.d(TAG, "onGovnoChanged: from Service: ${landmark[0].x()} : ${landmark[0].y()}")
//                        params.y = (landmark[8].y() * screenHeight).toInt()
//                        params.x = (landmark[8].x() * screenWidth).toInt()
//                        overlayButton.post {
//                            windowManager.updateViewLayout(overlayButton, params)
////                            overlayButton.layoutParams = params
//                        }
////                        overlayButton.layoutParams = params
//                    }
//
//                }
//            }
//
//        })
    }

    private fun setupHandLandMarkerHelper() {
        handLandmarkerHelper = HandLandmarkerHelper(
            context = this,
            runningMode = RunningMode.LIVE_STREAM,
            minHandDetectionConfidence = HandLandmarkerHelper.DEFAULT_HAND_DETECTION_CONFIDENCE,
            minHandTrackingConfidence = HandLandmarkerHelper.DEFAULT_HAND_TRACKING_CONFIDENCE,
            minHandPresenceConfidence = HandLandmarkerHelper.DEFAULT_HAND_PRESENCE_CONFIDENCE,
            maxNumHands = 1,
            currentDelegate = HandLandmarkerHelper.DELEGATE_CPU,
            handLandmarkerHelperListener = this
        )
    }

    private fun setUpCamera() {
        val cameraProviderFuture =
            ProcessCameraProvider.getInstance(this)
        cameraProviderFuture.addListener(
            {
                // CameraProvider
                cameraProvider = cameraProviderFuture.get()

                // Build and bind the camera use cases
                bindCameraUseCases()
            }, ContextCompat.getMainExecutor(this)
        )
    }

    // Declare and bind preview, capture and analysis use cases
    @SuppressLint("UnsafeOptInUsageError")
    private fun bindCameraUseCases() {

        // CameraProvider
        val cameraProvider = cameraProvider
            ?: throw IllegalStateException("Camera initialization failed.")

        val cameraSelector =
            CameraSelector.Builder().requireLensFacing(cameraFacing).build()

        // Preview. Only using the 4:3 ratio because this is the closest to our models
        preview = Preview.Builder()
            .setTargetAspectRatio(AspectRatio.RATIO_4_3)
//            .setTargetRotation(binding.previewCamera.display.rotation)
            .build()

        // ImageAnalysis. Using RGBA 8888 to match how our models work
        imageAnalyzer =
            ImageAnalysis.Builder()
                .setTargetAspectRatio(AspectRatio.RATIO_4_3)
//                .setTargetRotation(binding.previewCamera.display.rotation)
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .setOutputImageFormat(ImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888)
                .build()
                // The analyzer can then be assigned to the instance
                .also {
                    it.setAnalyzer(backgroundExecutor) { image ->
                        detectHand(image)
                    }
                }
        // Must unbind the use-cases before rebinding them
        cameraProvider.unbindAll()

        try {
            // A variable number of use-cases can be passed here -
            // camera provides access to CameraControl & CameraInfo
            camera = cameraProvider.bindToLifecycle(
                this, cameraSelector, preview, imageAnalyzer
            )

            // Attach the viewfinder's surface provider to preview use case
//            preview?.setSurfaceProvider(binding.previewCamera.surfaceProvider)
        } catch (exc: Exception) {
            Log.e(ContentValues.TAG, "Use case binding failed", exc)
        }
    }

    private fun detectHand(imageProxy: ImageProxy) {

        handLandmarkerHelper.detectLiveStream(
            imageProxy = imageProxy,
            isFrontCamera = cameraFacing == CameraSelector.LENS_FACING_FRONT
        )
    }

    override fun onDestroy() {
        super.onDestroy()
        windowManager.removeView(overlayButton)
    }


    override fun onError(error: String, errorCode: Int) {
        Log.d(TAG, "onError: $error")
//        TODO("Not yet implemented")
    }

    override fun onResults(resultBundle: HandLandmarkerHelper.ResultBundle) {

        val govno = resultBundle.results.first()
        govno?.let { handLandmarkerResult ->
                    for(landmark in handLandmarkerResult.landmarks()) {
//                        Log.d(TAG, "onGovnoChanged: from Service: ${landmark[0].x()} : ${landmark[0].y()}")
                        params.y = ((landmark[8].y() * screenHeight)).toInt()
                        params.x = ((landmark[8].x() * screenWidth)).toInt()
                        overlayButton.post {
                            windowManager.updateViewLayout(overlayButton, params)
//                            overlayButton.layoutParams = params
                        }
//                        overlayButton.layoutParams = params
                    }

                }
    }


}