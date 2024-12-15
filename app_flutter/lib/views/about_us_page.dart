import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/theme.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Acne Detection App - Glowbies',
                style: medium18,
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to our innovative Acne Detection App! This application helps users identify and analyze different types of acne through advanced image processing technology. Using your device\'s camera, you can capture photos of skin concerns and receive instant analysis about the type of acne present.\n\n'
                'Our app combines artificial intelligence with dermatological expertise to provide reliable skin assessments, making it easier for users to understand their skin conditions and take appropriate care measures.\n\n'
                'Key Features:\n'
                '• Instant acne type detection\n'
                '• Detailed skin analysis reports\n'
                '• User-friendly interface\n'
                '• Secure and private analysis\n'
                '• Personalized skincare recommendations\n\n'
                'This project was developed as part of PBL Semester 5, combining expertise in machine learning, mobile development, and healthcare technology to create a practical solution for skin health management.',
                style: medium14,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              Text(
                'Our Team',
                style: medium18,
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TeamMemberCard(
                      name: 'Arya Chandra Kusuma',
                      role: 'Backend Developer',
                      imageUrl: 'assets/images/woman.png',
                    ),
                    TeamMemberCard(
                      name: 'Elis Nurhidayati',
                      role: 'Frontend Developer',
                      imageUrl: 'assets/images/elis.jpg',
                    ),
                    TeamMemberCard(
                      name: 'Jantra Lang Lang Buana',
                      role: 'Machine Learning Engineer',
                      imageUrl: 'assets/images/woman.png',
                    ),
                    TeamMemberCard(
                      name: 'Putri Ayu Aliciawati',
                      role: 'UI/UX Designer',
                      imageUrl: 'assets/images/woman.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: red,
      child: Container(
        width: 200,
        height: 300,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: medium16,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      role,
                      style: medium14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
