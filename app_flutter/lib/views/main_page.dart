import 'package:flutter/material.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/home_page.dart';
import 'package:plugin_camera/views/profile_page.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';
import '../widgets/bottom_nav_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final pages = [
      const HomePage(),
      // CameraPage(cameras: cameras),
      const ScanHistoryPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[navigationProvider.currentIndex],
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
