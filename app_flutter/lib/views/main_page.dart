import 'package:flutter/material.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/home_page.dart';
import 'package:plugin_camera/views/profile_page.dart';
import 'package:plugin_camera/views/create_routine.dart';
import 'package:plugin_camera/views/tips_page.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';
import '../widgets/bottom_nav_widget.dart';
import 'package:flutter/services.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primary, // Match your app's theme color
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light background
    ));

    final navigationProvider = Provider.of<NavigationProvider>(context);

    final pages = [
      const HomePage(),
      // CameraPage(cameras: cameras),
      const ScanHistoryPage(),
      CreateRoutine(),
      const TipsPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[navigationProvider.currentIndex],
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
