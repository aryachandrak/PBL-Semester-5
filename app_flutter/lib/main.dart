// ignore_for_file: unused_import

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:plugin_camera/provider/user_provider.dart';
import 'package:plugin_camera/views/main_page.dart';
import 'package:plugin_camera/views/welcome/sign_up.dart';
import 'package:plugin_camera/views/welcome/splash_screen.dart';
import 'package:plugin_camera/views/welcome/user_form_screen.dart';
import 'package:plugin_camera/views/welcome/welcome_screen.dart';
import 'package:plugin_camera/views/welcome/welcome_screen3.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if(kIsWeb) {
  //   await Firebase.initializeApp(options: const FirebaseOptions(
  //   apiKey: "AIzaSyDDTW21Ks2TPxTu7O0t7igM79_WpTRGVJU",
  //   authDomain: "fire-setup-8bbd3.firebaseapp.com",
  //   projectId: "fire-setup-8bbd3",
  //   storageBucket: "fire-setup-8bbd3.firebasestorage.app",
  //   messagingSenderId: "309347257075",
  //   appId: "1:309347257075:web:d737104ff5d3ccd2828586"
  //   ));
  // }
  // else{
  //   await Firebase.initializeApp();
  // }

  final cameras = await availableCameras();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => HistoryProvider()),
    ],
    child: MainApp(cameras: cameras),
  ));
}

class MainApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MainApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(cameras: cameras),
      // home: SplashScreen(),
      // home: WelcomeScreen3(),
      home: SignUp(),
    );
  }
}
