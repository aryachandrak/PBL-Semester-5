import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/views/welcome/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:plugin_camera/provider/camera_provider.dart';
import 'provider/tips_page_provider.dart';
import 'firebase_options.dart';

import 'views/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        // ChangeNotifierProvider(create: (_) => TipsPageProvider()),
        ChangeNotifierProvider(
          create: (_) => CameraProvider()..setCameras(cameras),
        ),
      ],
      child: MainApp(
        cameras: [],
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required List cameras});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: MainPage(),
    );
  }
}
