import 'package:flutter/material.dart';

import 'agora_engine.dart';
import 'camera_view.dart';

const agoraAppId = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  final engine = AgoraEngine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 400.0,
                      height: 300.0,
                      color: Colors.black,
                      child: CameraView('my_camera'),
                    ),
                    Text('My camera'),
                  ],
                ),
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Container(
                      width: 400.0,
                      height: 300.0,
                      color: Colors.black,
                      child: CameraView('your_camera'),
                    ),
                    Text('Strange\'s camera'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 400.0,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter channel'),
                    controller: textController,
                  ),
                ),
                SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(Icons.call, color: Colors.green),
                  onPressed: () {

                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            IconButton(
              icon: Icon(Icons.videocam, color: Colors.deepOrange),
              onPressed: () {

              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
