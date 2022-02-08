import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';


class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}


class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(

      widget.camera,

      ResolutionPreset.medium,
    );


    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),

      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),

        onPressed: () async {

          try {

            await _initializeControllerFuture;


            final path = join(

              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );


            await _controller.takePicture(path);


            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {

            print(e);
          }
        },
      ),
    );
  }
}


class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  void _attachPhoto(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),

      body:Container(
          padding: const EdgeInsets.only(top:30),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Image.file(File(imagePath)),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                highlightColor: Colors.green[800],
                colorBrightness: Brightness.dark,
                elevation: 4.0,
                highlightElevation: 8.0,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Text("Attach"),
                onPressed: () {
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                highlightColor: Colors.green[800],
                colorBrightness: Brightness.dark,
                elevation: 4.0,
                highlightElevation: 8.0,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Text("Discard"),
                onPressed: () {
                },
              ),
            ],
          )
      ),
    );
  }
}