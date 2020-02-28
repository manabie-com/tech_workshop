//
//  IosPlatformMethodViewFactory.swift
//  flutter_plugin_workshop
//
//  Created by Phạm Như Vũ on 2/20/20.
//

import Foundation

@available(iOS 9.0, *)
class IosPlatformMethodViewFactory: NSObject, FlutterPlatformViewFactory {
    
    private weak var messenger: (NSObjectProtocol & FlutterBinaryMessenger)?
    private var viewType: String
    
    init(messenger: (NSObjectProtocol & FlutterBinaryMessenger)?, viewType: String) {
        self.messenger = messenger!
        self.viewType = viewType
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        let params = args as! Dictionary<String, Any>
        return IosPlatformMethodView(frame, messenger: messenger, methodChanelName: viewType + String(viewId), params: params)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
