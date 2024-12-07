import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/views/camera_page.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/home_page.dart';
import 'package:plugin_camera/views/profile_page.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';
import '../widgets/bottom_nav_widget.dart';

class MainPage extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MainPage({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final pages = [
      HomePage(cameras: cameras),
      // CameraPage(cameras: cameras),
      ScanHistoryPage(cameras: cameras,),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[navigationProvider.currentIndex],
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
