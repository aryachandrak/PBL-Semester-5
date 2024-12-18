import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_camera/provider/language_provider.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/provider/profile_image_provider.dart';
import 'package:plugin_camera/provider/routine_provider.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:plugin_camera/provider/camera_provider.dart';
import 'firebase_options.dart';
import 'views/welcome/splash_screen.dart';
import 'views/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set global status bar style
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primary,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  final cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(
          create: (context) => ProfileImageProvider(),
        ),
        ChangeNotifierProvider(create: (_) => RoutineProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(
          create: (_) => CameraProvider()..setCameras(cameras),
        ),
      ],
      child: const MainApp(
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
