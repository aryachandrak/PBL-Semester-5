// profile_view_model.dart
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _username = "Nama Pengguna";
  String _email = "email@contoh.com";
  String _telp = "0812345678";
  String get username => _username;
  String get email => _email;
  String get telp => _telp;

}
