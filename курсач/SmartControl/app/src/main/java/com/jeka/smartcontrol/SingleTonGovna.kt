package com.jeka.smartcontrol

import androidx.lifecycle.MutableLiveData
import com.google.mediapipe.examples.handlandmarker.HandLandmarkerHelper
import com.google.mediapipe.tasks.vision.handlandmarker.HandLandmarkerResult

class SingleTonGovna private constructor(){

    private var listenerGovna: ListenerGovna? = null
    var govno: HandLandmarkerResult? = null
        set(value) {
            field = value
            listenerGovna?.onGovnoChanged(value)
        }

    fun setListenerGovna(listenerGovna: ListenerGovna){
        this.listenerGovna = listenerGovna
    }

    interface ListenerGovna{
        fun onGovnoChanged(govno: HandLandmarkerResult?)
    }

    companion object {
        val instance: SingleTonGovna by lazy { SingleTonGovna() }
    }
}