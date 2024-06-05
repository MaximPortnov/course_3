package com.jeka.smartcontrol.activity

import android.annotation.SuppressLint
import android.content.ContentValues.TAG
import android.content.Intent
import android.content.res.Configuration
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.camera.core.AspectRatio
import androidx.camera.core.Camera
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.content.ContextCompat
import com.google.mediapipe.examples.handlandmarker.HandLandmarkerHelper
import com.google.mediapipe.tasks.vision.core.RunningMode
import com.jeka.smartcontrol.SingleTonGovna
import com.jeka.smartcontrol.databinding.ActivityMainBinding
import com.jeka.smartcontrol.service.OverlayService
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

class MainActivity : AppCompatActivity(), HandLandmarkerHelper.LandmarkerListener{


    private var preview: Preview? = null
    private var imageAnalyzer: ImageAnalysis? = null
    private var camera: Camera? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var cameraFacing = CameraSelector.LENS_FACING_FRONT
    private lateinit var handLandmarkerHelper: HandLandmarkerHelper
    private lateinit var binding: ActivityMainBinding

    /** Blocking ML operations are performed using this executor */
    private lateinit var backgroundExecutor: ExecutorService


    private val viewModel: MainViewModel by viewModels()

    override fun onDestroy() {
        super.onDestroy()
        backgroundExecutor.shutdown()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // начинаем сетапать штуки





//        backgroundExecutor = Executors.newSingleThreadExecutor()
////        binding.previewCamera.post(::setUpCamera)
//        setUpCamera()
//        backgroundExecutor.execute(::setupHandLandMarkerHelper)
////
        startService(Intent(this, OverlayService::class.java))
    }

    private fun setupHandLandMarkerHelper() {
        handLandmarkerHelper = HandLandmarkerHelper(
            context = this,
            runningMode = RunningMode.LIVE_STREAM,
            minHandDetectionConfidence = viewModel.currentMinHandDetectionConfidence,
            minHandTrackingConfidence = viewModel.currentMinHandTrackingConfidence,
            minHandPresenceConfidence = viewModel.currentMinHandPresenceConfidence,
            maxNumHands = viewModel.currentMaxHands,
            currentDelegate = viewModel.currentDelegate,
            handLandmarkerHelperListener = this
        )
    }


    // Initialize CameraX, and prepare to bind the camera use cases
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
            Log.e(TAG, "Use case binding failed", exc)
        }
    }

    private fun detectHand(imageProxy: ImageProxy) {
        handLandmarkerHelper.detectLiveStream(
            imageProxy = imageProxy,
            isFrontCamera = cameraFacing == CameraSelector.LENS_FACING_FRONT
        )
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
//        imageAnalyzer?.targetRotation =
//            binding.previewCamera.display.rotation
    }

    override fun onError(error: String, errorCode: Int) {
        Log.d(TAG, "onError: $error");
    }

    override fun onResults(resultBundle: HandLandmarkerHelper.ResultBundle) {
        SingleTonGovna.instance.govno = resultBundle.results.first()

        runOnUiThread {

//            fragmentCameraBinding.bottomSheetLayout.inferenceTimeVal.text =
//                String.format("%d ms", resultBundle.inferenceTime)

            // Pass necessary information to OverlayView for drawing on the canvas
            binding.overlay.setResults(
                resultBundle.results.first(),
                resultBundle.inputImageHeight,
                resultBundle.inputImageWidth,
                RunningMode.LIVE_STREAM
            )

            // Force a redraw
            binding.overlay.invalidate()
        }
    }

}