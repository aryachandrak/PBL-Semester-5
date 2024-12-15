import 'package:flutter/material.dart';

class ProfileImageProvider with ChangeNotifier {
  String? _profileImagePath;

  String? get profileImagePath => _profileImagePath;

  void setProfileImagePath(String? path) {
    _profileImagePath = path;
    notifyListeners();
  }
}
