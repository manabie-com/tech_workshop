package com.manabie.flutter_plugin_workshop.android_platform_method_view

import android.content.Context
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

class AndroidPlatformMethodViewNative(context: Context?) : LinearLayout(context) {
    val textView: TextView = TextView(context)
    val buttonTap1: Button = Button(context)
    val buttonTap2: Button = Button(context)

    init {
        layoutParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT)
        orientation = VERTICAL
        addView(textView)
        addView(buttonTap1)
        addView(buttonTap2)
        buttonTap1.text = "Tap 1"
        buttonTap2.text = "Tap 2"
    }
    
    var value: String
        get() = textView.text.toString()
        set(newValue) {
            textView.text = newValue
        }
}