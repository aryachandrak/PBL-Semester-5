import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/custom_button.dart';
import 'package:plugin_camera/widgets/theme.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Mendapatkan ukuran layar

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, // Padding horizontal 5% dari lebar
            vertical: size.height * 0.02, // Padding vertical 2% dari tinggi
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.15, // Ukuran lingkaran sesuai layar
                  backgroundColor: Colors.pink,
                  backgroundImage: const AssetImage('assets/profile.jpg'),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: Text(
                  'Your Full Name',
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'yourEmail@email.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * 0.04,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              _buildInputField(
                labelText: 'Full Name',
                size: size,
              ),
              const SizedBox(height: 5),
              _buildInputField(
                labelText: 'Email',
                size: size,
              ),
              const SizedBox(height: 5),
              _buildInputField(
                labelText: 'Phone number',
                size: size,
                prefixIcon: const Icon(Icons.phone),
              ),
              const SizedBox(height: 5),
              _buildDropdownField(
                labelText: 'Select your gender',
                items: ['Male', 'Female', 'Other'],
                size: size,
              ),
              const SizedBox(height: 5),
              _buildInputField(
                labelText: 'What is your date of birth?',
                size: size,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              const SizedBox(height: 100), // ElevatedButton(
              //   onPressed: () {
              //     // Action to update profile
              //   },
              //   child: Text(
              //     'Update Profile',
              //     style: TextStyle(
              //       fontSize: size.width * 0.045,
              //       color: Colors.white,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size(double.infinity, size.height * 0.07),
              //     backgroundColor: Colors.blue,
              //   ),
              // ),
              CustomButton(
                text: 'Update Profile',
                onPressed: () {
                  print('Updated Profile');
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String labelText,
    required Size size,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: primary),
          labelStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String labelText,
    required List<String> items,
    required Size size,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: primary),
          labelStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
        ),
        items: items
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
