import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/views/camera_page.dart';
import 'package:plugin_camera/views/home_page.dart';
import 'package:plugin_camera/views/profile_page.dart';

class MainPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const MainPage({super.key, required this.cameras});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      CameraPage(cameras: widget.cameras),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_rounded), label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: "Profile")
        ],
      ),
    );
  }
}
