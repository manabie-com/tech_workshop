import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_platform_method_view_controller.dart';

class FlutterPlatformMethodView extends StatefulWidget {
  final double width;
  final double height;
  final Function(FlutterPlatformMethodViewController controller)
      onFlutterPlatformMethodViewCreated;

  const FlutterPlatformMethodView({
    Key key,
    this.width,
    this.height,
    this.onFlutterPlatformMethodViewCreated,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlutterPlatformMethodViewState();
  }
}

class FlutterPlatformMethodViewState extends State<FlutterPlatformMethodView> {
  String _viewType = "flutter_platform_method_view";
  FlutterPlatformMethodViewController _controller;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    Widget platformView;

    if (Platform.isIOS) {
      platformView = UiKitView(
        viewType: _viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParamsfromWidget(widget),
      );
    } else if (Platform.isAndroid) {
      platformView = AndroidView(
        viewType: _viewType,
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParamsfromWidget(widget),
      );
    } else {
      platformView = Text("Widget doesn't support this platform");
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Flutter View"),
            Text(_count.toString()),
            RaisedButton(
              child: Text("Tap 1"),
              onPressed: () => _controller.tap1(),
            ),
            RaisedButton(
              child: Text("Tap 2"),
              onPressed: () => _controller.tap2(),
            )
          ],
        ),
        SizedBox(width: 20.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Native View"),
            SizedBox(
              width: widget.width,
              height: widget.height,
              child: platformView,
            )
          ],
        ),
      ],
    );
  }

  onPlatformViewCreated(id) {
    FlutterPlatformMethodViewController controller =
        FlutterPlatformMethodViewController(
      _viewType + id.toString(),
      onTap1: _add,
      onTap2: _add,
    );
    _controller = controller;
    widget.onFlutterPlatformMethodViewCreated(controller);
  }

  _add(int number) {
    setState(() {
      _count += number;
    });
  }

  Map<String, dynamic> _creationParamsfromWidget(
      FlutterPlatformMethodView widget) {
    return <String, dynamic>{};
  }
}
