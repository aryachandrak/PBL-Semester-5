import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/views/tip_detail_page.dart';
import 'package:plugin_camera/views/tips_page.dart';
import 'package:plugin_camera/widgets/theme.dart';

class Wawasan extends StatefulWidget {
  const Wawasan({super.key});

  @override
  State<Wawasan> createState() => _WawasanCarouselState();
}

class _WawasanCarouselState extends State<Wawasan> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentPage = (_currentPage + 1) % carouselItems.length;

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Color.fromARGB(255, 211, 198, 198),
      //       Color.fromARGB(255, 192, 250, 255),
      //     ],
      //   ),
      // ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Acne Insights 😇',
              style: medium16,
            ),
          ),
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  if (_currentPage == carouselItems.length - 1) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      _pageController.jumpToPage(0);
                    });
                  }
                });
              },
              itemCount: carouselItems.length,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _currentPage == index ? 1.0 : 0.8,
                  child: _buildCarouselItem(
                    carouselItems[index]["image"]!,
                    carouselItems[index]["id"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

// Update the carouselItems list to include IDs
  final List<Map<String, dynamic>> carouselItems = [
    {"image": "assets/images/blackheads.jpg", "id": 1},
    {"image": "assets/images/whiteheads.jpg", "id": 2},
    {"image": "assets/images/pustula.jpg", "id": 3},
    {"image": "assets/images/papula.jpg", "id": 1},
    {"image": "assets/images/kistik.jpg", "id": 2},
  ];

// Modify the _buildCarouselItem method
  Widget _buildCarouselItem(String imagePath, int id) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () async {
          final String response =
              await rootBundle.loadString('assets/acne.json');
          final Map<String, dynamic> data = json.decode(response);
          final List<dynamic> popularList = data['Popular'];

          final matchedTip = popularList.firstWhere(
            (tipData) => tipData['id'] == id,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TipDetailPage(
                topicTitle: matchedTip['topic'],
                title: matchedTip['title'],
                explanation: matchedTip['explanation'],
                image: matchedTip['image'],
                causes: List<String>.from(matchedTip['causes']),
                treatment: List<String>.from(matchedTip['treatment']),
                dailyRoutine: List<String>.from(matchedTip['daily_routine']),
              ),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 300,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
