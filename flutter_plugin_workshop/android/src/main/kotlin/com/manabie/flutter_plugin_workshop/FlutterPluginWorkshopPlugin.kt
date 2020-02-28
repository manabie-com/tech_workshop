package com.manabie.flutter_plugin_workshop

import androidx.annotation.NonNull
import com.manabie.flutter_plugin_workshop.android_platform_method_view.AndroidPlatformMethodViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterPluginWorkshopPlugin */
class FlutterPluginWorkshopPlugin : FlutterPlugin {
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

        val viewType = "flutter_platform_method_view"
        val factory = AndroidPlatformMethodViewFactory(
                flutterPluginBinding.flutterEngine.dartExecutor,
                viewType
        )
        flutterPluginBinding.platformViewRegistry.registerViewFactory(viewType, factory)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }
}
