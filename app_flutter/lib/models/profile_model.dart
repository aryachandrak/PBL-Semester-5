// profile_view_model.dart
import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {
  // Sample data
  final String _username = "Nama Pengguna";
  final String _email = "email@contoh.com";
  String get username => _username;
  String get email => _email;
}
