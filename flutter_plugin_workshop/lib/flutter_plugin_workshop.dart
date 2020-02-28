import 'dart:async';

import 'package:flutter/services.dart';

export 'package:flutter_plugin_workshop/flutter_platform_method_view/flutter_platform_method_view.dart';
export 'package:flutter_plugin_workshop/flutter_platform_method_view/flutter_platform_method_view_controller.dart';

class FlutterPluginWorkshop {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_workshop');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
