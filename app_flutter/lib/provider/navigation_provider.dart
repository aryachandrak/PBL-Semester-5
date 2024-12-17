import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/views/about_us_page.dart';
import 'package:plugin_camera/views/app_language_page.dart';
import 'package:plugin_camera/views/auth/login_page.dart';
import 'package:plugin_camera/views/camera_page.dart';
import 'package:plugin_camera/views/create_routine.dart';
import 'package:plugin_camera/views/edit_account_page.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/main_page.dart';
import 'package:plugin_camera/views/manage_pass_page.dart';
import 'package:plugin_camera/views/notification_page.dart';
import 'package:plugin_camera/views/profile_page.dart';
import 'package:plugin_camera/views/tips_page.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0; // Index halaman aktif untuk bottom navigation

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Memberitahu listener untuk update UI
  }

  // Fungsi untuk berpindah ke halaman tertentu
  Future<void> navigateToPage(BuildContext context, String page,
      {dynamic arguments}) async {
    switch (page) {
      case 'EditAccount':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditAccountPage()),
        );
        break;
      case 'ScanHistory':
        setIndex(1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ScanHistoryPage(),
          ),
        );
        break;
      case 'Camera':
        final cameras = await availableCameras();
        if (cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPage(cameras: cameras),
            ),
          );
        }
        break;
      // if (arguments is List<CameraDescription>) {
      //   setIndex(2);
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => CameraPage(cameras: arguments),
      //     ),
      //   );
      // } else {
      //   print("Error: Invalid arguments for CameraPage!");
      // }
      // break;
      // Add this case inside the switch statement in the navigateToPage method:

      case 'Routine':
        setIndex(2);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateRoutine()),
        );
        break;

      case 'Tips':
        setIndex(3);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TipsPage(),
          ),
        );
        break;
      case 'ProfilePage':
        setIndex(4);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      case 'ManagePassword':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ManagePassPage()),
        );
        break;
      case 'AboutApp':
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ScanHistoryPage()),
        // );
        break;
      case 'Notification':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationPage()),
        );
        break;
      case 'AboutUs':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsPage()),
        );
        break;
      case 'AppLanguage':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AppLanguagePage()),
        );
        break;
      case 'Home':
        setIndex(0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
        break;
      case 'login':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      // Tambahkan case lain sesuai dengan halaman yang ingin dituju
      default:
        break;
    }
  }
}
