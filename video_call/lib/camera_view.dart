import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final String userId;

  const CameraView(this.userId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CameraViewState();
  }
}

class _CameraViewState extends State<CameraView> {
  late html.DivElement _element;
  late String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'camera_view${DateTime.now().millisecondsSinceEpoch}';

    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      _viewType,
      (int viewId) {
        _element = html.DivElement()
          ..id = '${widget.userId}'
          ..style.width = '640px'
          ..style.height = '480px';
        return _element;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 640,
      height: 480,
      child: HtmlElementView(
        key: widget.key,
        viewType: _viewType,
      ),
    );
  }
}
