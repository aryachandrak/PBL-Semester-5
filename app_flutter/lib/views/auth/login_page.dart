import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/views/auth/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape
                          .circle, // Opsional: Membuat gambar berbentuk lingkaran
                    ),
                    child: Image.asset(
                      'assets/logoCoba.png', // Path gambar lokal
                      fit: BoxFit.cover, // Atur sesuai kebutuhan
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Icon(
                          Icons.error, // Ikon fallback jika gambar gagal dimuat
                          size: 40,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hello There!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let's glow together with us",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Nama Field
// Email Field
            TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat tidak fokus
                    width: 2.0, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat fokus
                    width: 3.0, // Ketebalan border lebih tebal saat fokus
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 16),
// Password Field
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat tidak fokus
                    width: 2.0, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat fokus
                    width: 3.0, // Ketebalan border lebih tebal saat fokus
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 24),
            // Tombol Lanjutkan
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await signIn();
                  Provider.of<HistoryProvider>(context, listen: false)
                      .clearHistory();
                  context.read<NavigationProvider>().navigateToPage(
                        context,
                        'Home',
                      );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email atau password salah')),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF6DA06F), // Warna hijau pada tombol
                  borderRadius: BorderRadius.circular(16), // Sudut membulat
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 14), // Padding dalam tombol
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Divider atau pemisah
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Atau',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Tombol Google Login
            GestureDetector(
              onTap: () {
                developer.log("Google login pressed", name: "GestureDetector");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://bmw.astra.co.id/wp-content/uploads/2023/07/BMW.svg_-300x300.png', // Path logo Google
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Login dengan Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Footer
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6DA06F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
