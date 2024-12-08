import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/custom_button.dart';

class EditAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Mendapatkan ukuran layar

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'), centerTitle: true,
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
              SizedBox(height: size.height * 0.02),
              _buildInputField(
                labelText: 'Email',
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              _buildInputField(
                labelText: 'Phone number',
                size: size,
                prefixIcon: const Icon(Icons.phone),
              ),
              SizedBox(height: size.height * 0.02),
              _buildDropdownField(
                labelText: 'Select your gender',
                items: ['Male', 'Female', 'Other'],
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              _buildInputField(
                labelText: 'What is your date of birth?',
                size: size,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              SizedBox(height: size.height * 0.04),
              // ElevatedButton(
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
              )
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
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
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
