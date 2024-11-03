import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/login_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Get Started")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => authProvider.setEmail(value),
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              onChanged: (value) => authProvider.setEmail(value),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) => authProvider.setPassword(value),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: const Text("I agree to the processing of Personal data"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up logic
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

