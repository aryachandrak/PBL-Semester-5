import 'package:flutter/material.dart';
import 'package:plugin_camera/models/user_form.dart';
import 'user_helper.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String? _gender;
  int _age = 0;

  String get name => _name;
  String? get gender => _gender;
  int get age => _age;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  Future<void> saveUser() async {
    if (_name.isNotEmpty && _gender != null && _age > 0) {
      final user = UserForm(name: _name, gender: _gender!, age: _age);
      await UserHelper().insertUser(user.toMap());
      // Clear fields after saving
      _name = '';
      _gender = null;
      _age = 0;
      notifyListeners();
    }
  }
}
