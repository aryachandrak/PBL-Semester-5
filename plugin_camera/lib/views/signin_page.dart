import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/login_provider.dart';
import 'package:plugin_camera/views/home_page.dart';
import 'package:plugin_camera/views/main_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SigninPage({super.key});
  
  Future<void> _signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    }
  }

  Future<void> _signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, const HomePage() as String);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in failed. Please try again.')),
      );
    }
    if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter both email and password.')),
    );
    return;
}

  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    bool rememberMe = false;

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome back")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => authProvider.setEmail(value),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) => authProvider.setPassword(value),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    rememberMe = value ?? false;
                  },
                ),
                const Text("Remember me"),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: const Text("Forgot password?"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _signInWithEmailAndPassword(
                  authProvider.email,
                  authProvider.password,
                  context,
                );
              },
              child: const Text("Sign In"),
            ),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.google,
              onPressed: _signInWithGoogle,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/getStarted'),
              child: const Text("Don’t have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
