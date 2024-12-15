import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_camera/models/tips_item.dart';
import 'package:plugin_camera/views/tip_detail_page.dart';
import 'package:plugin_camera/widgets/theme.dart';

class TipsListPage extends StatelessWidget {
  final String topicTitle;
  final List<TipsItem> tips;

  const TipsListPage({
    super.key,
    required this.topicTitle,
    required this.tips,
  });

  Future<void> _navigateToDetail(BuildContext context, TipsItem tip) async {
    final String response = await rootBundle.loadString('assets/acne.json');
    final Map<String, dynamic> data = json.decode(response);
    final Map<String, dynamic> tipsList = data['TipsList'];
    final List<dynamic> topicTips = tipsList[topicTitle] ?? [];

    final matchedTip = topicTips.firstWhere(
      (tipData) => tipData['title'] == tip.title,
    );

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TipDetailPage(
          topicTitle: tip.topic,
          title: matchedTip['title'],
          explanation: matchedTip['description']['explanation'],
          image: matchedTip['image'],
          causes: List<String>.from(matchedTip['description']['causes']),
          treatment:
              List<String>.from(matchedTip['description']['how_to_overcome']),
          dailyRoutine:
              List<String>.from(matchedTip['description']['daily_routines']),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          topicTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: grey,
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return GestureDetector(
            onTap: () => _navigateToDetail(context, tip),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Image.asset(
                      tip.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip.title,
                          style: medium16.copyWith(color: text),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          topicTitle,
                          style: regular14.copyWith(color: textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
