// profile_view_model.dart
import 'package:flutter/material.dart';
import 'package:plugin_camera/views/history_page.dart';

class ProfileModel extends ChangeNotifier {
  // Sample data
  String _username = "Nama Pengguna";
  String _email = "email@contoh.com";
  String get username => _username;
  String get email => _email;

  // Actions for handling UI interactions
  void onLogout() {
    // Handle logout logic
    print("Logout pressed");
    notifyListeners();
  }

  void onSettings() {
    // Handle settings logic
    print("Settings pressed");
    notifyListeners();
  }

  void navigateToAccount() {
    // Handle account navigation
    print("Navigate to Account");
    notifyListeners();
  }

  void navigateToNotifications() {
    // Handle notifications navigation
    print("Navigate to Notifications");
    notifyListeners();
  }

  void navigateToHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanHistoryPage()),
    );
  }

  void navigateToPasswords() {
    // Handle passwords navigation
    print("Navigate to Passwords");
    notifyListeners();
  }

  void navigateToLanguage() {
    // Handle language settings navigation
    print("Navigate to Language");
    notifyListeners();
  }
}
