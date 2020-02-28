package com.manabie.flutter_plugin_workshop.android_platform_method_view

import android.content.Context
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AndroidPlatformMethodViewFactory(private val executor: DartExecutor, private val viewType: String) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val params = args as Map<String, Any>? //To change body of created functions use File | Settings | File Templates.
        return AndroidPlatformMethodView(context, executor, viewType + viewId, params)
    }

}