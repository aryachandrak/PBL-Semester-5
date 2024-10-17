import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/camera_page.dart';
import 'package:plugin_camera/home_page.dart';
import 'package:plugin_camera/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  runApp(MainApp(
    cameras: cameras,
  ));
}

class MainApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MainApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: MainPage(cameras: cameras),
    );
  }
}

class MainPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const MainPage({Key? key, required this.cameras}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List of pages for the navigation
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      CameraPage(cameras: widget.cameras), // Access cameras via widget.cameras
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the current selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        items: [
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
