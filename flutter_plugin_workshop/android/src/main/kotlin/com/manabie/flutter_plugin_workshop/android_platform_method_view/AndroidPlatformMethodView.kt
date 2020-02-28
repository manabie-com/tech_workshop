package com.manabie.flutter_plugin_workshop.android_platform_method_view

import android.content.Context
import android.view.View
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class AndroidPlatformMethodView(context: Context?, executor: DartExecutor, methodChannelName: String, params: Map<String, Any>?) : PlatformView {

    private var nativeView: AndroidPlatformMethodViewNative? = AndroidPlatformMethodViewNative(context)
    private var method: MethodChannel? = MethodChannel(executor, methodChannelName)
    private var count: Int = 0
    
    init {
        method?.setMethodCallHandler { call, result ->
            when (call.method) {
                "tap1Flutter" -> {
                    val value = call.arguments as Int
                    count += value
                    nativeView!!.value = count.toString()
                    result.success(null)
                }

                "tap2Flutter" -> {
                    val value = call.arguments as Int
                    count += value
                    nativeView!!.value = count.toString()
                    result.success(null)
                }
            }
        }
        nativeView!!.value = count.toString()

        nativeView!!.buttonTap1.setOnClickListener {
            method?.invokeMethod("tap1Native", 1)
        }

        nativeView!!.buttonTap2.setOnClickListener {
            method?.invokeMethod("tap2Native", 2)
        }
    }

    override fun getView(): View {
        return nativeView!!
    }

    override fun dispose() {
        method?.setMethodCallHandler(null)
        method = null
        nativeView = null
    }
}