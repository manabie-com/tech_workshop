import 'package:flutter/services.dart';

class FlutterPlatformMethodViewController {
  MethodChannel _methodChannel;

  FlutterPlatformMethodViewController(String methodChannelName, {Function(int) onTap1, Function(int) onTap2}) {
    _methodChannel = MethodChannel(methodChannelName);
    _methodChannel.setMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'tap1Native':
          onTap1(methodCall.arguments as int);
          break;

        case 'tap2Native':
          onTap2(methodCall.arguments as int);
          break;
      }
    });
  }

  Future<void> tap1() {
    return _methodChannel.invokeMethod('tap1Flutter', 1);
  }

  Future<void> tap2() async {
    return _methodChannel.invokeMethod('tap2Flutter', 2);
  }
}
