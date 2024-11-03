import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/login_provider.dart';
import 'package:plugin_camera/views/signin_page.dart';
import 'package:plugin_camera/views/signup_page.dart';
import 'package:plugin_camera/views/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MainLogin(),
    ),
  );
}

class MainLogin extends StatelessWidget {
  const MainLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomePage(),
      routes: {
        '/signIn': (_) => SigninPage(),
        '/getStarted': (_) => const SignupPage(),
        
      },
    );
  }
}

