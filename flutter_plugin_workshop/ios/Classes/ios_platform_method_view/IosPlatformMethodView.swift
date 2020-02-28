//
//  IosPlatformMethodView.swift
//  flutter_plugin_workshop
//
//  Created by Phạm Như Vũ on 2/20/20.
//

import Foundation
import Flutter


@available(iOS 9.0, *)
class IosPlatformMethodView: NSObject, FlutterPlatformView {
    
    private var nativeView: IosPlatformMethodViewNative?
    private var method: FlutterMethodChannel?
    private var count: Int = 0
    
    init(_ frame: CGRect, messenger: FlutterBinaryMessenger?, methodChanelName: String, params: Dictionary<String, Any>) {
        nativeView = IosPlatformMethodViewNative(frame: frame)
        method = FlutterMethodChannel(name: methodChanelName, binaryMessenger: messenger!)
        
        super.init()
        
        nativeView!.initView()
        nativeView!.value = String(0)
        nativeView!.btn1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        nativeView!.btn2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        
        method?.setMethodCallHandler({
            [self](call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "tap1Flutter":
                let value = call.arguments as! Int
                self.count += value
                self.nativeView!.label.text = String(self.count)
                result(nil)
                
            case "tap2Flutter":
                let value = call.arguments as! Int
                self.count += value
                self.nativeView!.label.text = String(self.count)
                result(nil)
                
            default:
                result(FlutterMethodNotImplemented)
            }})
    }
    
    @objc func tap1() {
        method?.invokeMethod("tap1Native", arguments: 1)
    }
    
    @objc func tap2() {
        method?.invokeMethod("tap2Native", arguments: 2)
    }
    
    func view() -> UIView {
        nativeView!
    }
    
    deinit {
        method?.setMethodCallHandler(nil)
        method = nil
        nativeView = nil
    }
}
