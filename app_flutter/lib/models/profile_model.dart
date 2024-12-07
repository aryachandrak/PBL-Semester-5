// profile_view_model.dart
import 'package:flutter/material.dart';
import 'package:plugin_camera/views/history_page.dart';

class ProfileModel extends ChangeNotifier {
  // Sample data
  String _username = "Nama Pengguna";
  String _email = "email@contoh.com";
  String get username => _username;
  String get email => _email;
}
