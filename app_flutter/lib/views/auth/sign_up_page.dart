import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  Future<void> signUp() async {
    if (name.text.isEmpty || email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua bidang harus diisi')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Perbarui nama di Firebase Authentication
      await userCredential.user?.updateDisplayName(name.text);

      // Navigasi ke halaman berikutnya setelah berhasil registrasi
      context.read<NavigationProvider>().navigateToPage(context, 'Home');
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Gagal mendaftar. Silakan coba lagi.';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email sudah terdaftar.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Kata sandi terlalu lemah.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email tidak valid.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name.text,
          'email': email.text,
          'profil_page': null,
          'createdAt': FieldValue.serverTimestamp(),
        });
      } else {
        print('User not logged in');
      }

      setState(() {
        isLoading = false;
      });
    }
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
// User Field
            TextField(
              controller: name,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_2_outlined),
                labelText: 'Nama',
                floatingLabelStyle: const TextStyle(color: Color(0xFF6DA06F)),
                labelStyle: const TextStyle(color: Colors.grey),
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
// Email Field
            TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email',
                floatingLabelStyle: const TextStyle(color: Color(0xFF6DA06F)),
                labelStyle: const TextStyle(color: Colors.grey),
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
                floatingLabelStyle: const TextStyle(color: Color(0xFF6DA06F)),
                labelStyle: const TextStyle(color: Colors.grey),
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
            // Tombol Sign Up
            GestureDetector(
              onTap: () async {
                await signUp();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.grey
                      : const Color(0xFF6DA06F), // Warna tombol
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
