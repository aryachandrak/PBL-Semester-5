import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:plugin_camera/views/main_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  runApp(MultiProvider(
    providers: [
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(cameras: cameras),
    );
  }
}
