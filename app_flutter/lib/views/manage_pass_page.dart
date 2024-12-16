import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/custom_button.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ManagePassPage extends StatefulWidget {
  const ManagePassPage({super.key});

  @override
  State<ManagePassPage> createState() => _ManagePassPageState();
}

class _ManagePassPageState extends State<ManagePassPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscuredCurrent = true;
  bool _isObscuredNew = true;
  bool _isObscuredConfirm = true;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        _showLoadingDialog(context);

        if (user != null) {
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: _currentPasswordController.text,
          );
          // Reauthenticate untuk memverifikasi user dan password saat ini
          await user.reauthenticateWithCredential(credential);

          // Setelah verifikasi benar, update password
          await user.updatePassword(_newPasswordController.text);

          Navigator.of(context).pop();
          _showDialog(context, "Password updated successfully",
              Icons.check_circle, Colors.green);

          // Reset form setelah berhasil
          _currentPasswordController.clear();
          _newPasswordController.clear();
          _confirmPasswordController.clear();
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'invalid-credential') {
          Navigator.of(context).pop();
          _showDialog(context, "The current password is incorrect",
              Icons.cancel, Colors.red);
        } else {
          Navigator.of(context).pop();
          print("Firebase authentication error: ${e.message}");
        }
      }
    }
  }

  void _showDialog(
      BuildContext context, String message, IconData icon, Color iconColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(icon, size: 50, color: iconColor),
          content: Text(message, textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Menonaktifkan dismiss dengan klik di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(), // Menampilkan indikator loading
              SizedBox(width: 20),
              Text(
                  "Processing..."), // Teks untuk memberi tahu bahwa proses sedang berlangsung
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Manage Password',
              style: medium18.copyWith(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current Password Field
                  TextFormField(
                    controller: _currentPasswordController,
                    obscureText: _isObscuredCurrent,
                    decoration: InputDecoration(
                      labelText: "Current Password",
                      floatingLabelStyle: TextStyle(color: primary),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF6DA06F), width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscuredCurrent
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscuredCurrent = !_isObscuredCurrent;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your current password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // New Password Field
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: _isObscuredNew,
                    decoration: InputDecoration(
                      labelText: "New Password",
                      floatingLabelStyle: TextStyle(color: primary),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF6DA06F), width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscuredNew
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscuredNew = !_isObscuredNew;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your new password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isObscuredConfirm,
                    decoration: InputDecoration(
                      labelText: "Confirm New Password",
                      floatingLabelStyle: TextStyle(color: primary),
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFF6DA06F), width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscuredConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscuredConfirm = !_isObscuredConfirm;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your new password";
                      }
                      if (value != _newPasswordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      text: 'Change Password',
                      onPressed: () {
                        _submit();
                      },
                      widthFactor: 1.0,
                      heightFactor: 0.06,
                      fontSizeFactor: 0.02,
                      borderRadius: 12.0,
                      textColor: Colors.white,
                      gradientColors: const [
                        Color(0xFF6DA06F),
                        Color(0xFF6DA06F),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
