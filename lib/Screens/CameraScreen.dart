// import 'dart:io';

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chat_app_web_socket_io/Screens/CameraPreviewScreen.dart';
import 'package:chat_app_web_socket_io/Screens/VideoPreviewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  bool isRecording = false;
  bool isFront = false;
  bool isFlashOn = false;
  // int cameraMode = 0;

  Future? cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectCamera(0);
  }

  selectCamera(cameraMode) {
    _cameraController =
        CameraController(cameras![cameraMode], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_cameraController!),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              color: Color.fromARGB(80, 0, 0, 0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: !isFront
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      isFront
                          ? Container()
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  isFlashOn = !isFlashOn;
                                });
                                isFlashOn
                                    ? _cameraController!
                                        .setFlashMode(FlashMode.torch)
                                    : _cameraController!
                                        .setFlashMode(FlashMode.off);
                              },
                              icon: Icon(
                                isFlashOn ? Icons.flash_on : Icons.flash_off,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                      GestureDetector(
                        onLongPress: () {
                          setState(() {
                            isRecording = true;
                          });
                          takeVideo(context);
                        },
                        onLongPressUp: () {
                          setState(() {
                            isRecording = false;
                          });
                          stopVideo(context);
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFront = !isFront;
                          });
                          isFront ? selectCamera(1) : selectCamera(0);
                        },
                        icon: isFront
                            ? Transform.rotate(
                                angle: pi,
                                child: Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              )
                            : Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                                size: 28,
                              ),
                      ),
                    ],
                  ),
                  Text(
                    "Hold for video, Tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    // final String path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile image = await _cameraController!.takePicture();
    // image.path;
    if (image.path.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => CameraPreviewScreen(
            path: image.path,
          ),
        ),
      );
    }
  }

  Future<void> takeVideo(BuildContext context) async {
    await _cameraController!.startVideoRecording();
  }

  Future<void> stopVideo(BuildContext context) async {
    XFile video = await _cameraController!.stopVideoRecording();

    if (video.path.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => VideoPreviewScreen(
            path: video.path,
          ),
        ),
      );
    }
  }
}
