import Flutter
import UIKit

@available(iOS 9.0, *)
public class SwiftFlutterPluginWorkshopPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let viewType = "flutter_platform_method_view"
    let factory = IosPlatformMethodViewFactory(messenger: registrar.messenger(), viewType: viewType)
    registrar.register(factory, withId: viewType)
  }
}
