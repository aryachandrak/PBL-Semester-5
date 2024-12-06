// camera_provider.dart
import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  List<CameraDescription> _cameras = [];

  List<CameraDescription> get cameras => _cameras;

  void setCameras(List<CameraDescription> cameras) {
    _cameras = cameras;
    notifyListeners();
  }
}
