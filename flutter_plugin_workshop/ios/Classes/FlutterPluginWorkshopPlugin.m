#import "FlutterPluginWorkshopPlugin.h"
#if __has_include(<flutter_plugin_workshop/flutter_plugin_workshop-Swift.h>)
#import <flutter_plugin_workshop/flutter_plugin_workshop-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_plugin_workshop-Swift.h"
#endif

@implementation FlutterPluginWorkshopPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPluginWorkshopPlugin registerWithRegistrar:registrar];
}
@end
