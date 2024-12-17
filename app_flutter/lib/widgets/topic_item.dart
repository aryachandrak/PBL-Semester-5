import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_camera/models/tips_item.dart';
import 'package:plugin_camera/models/topic.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:plugin_camera/views/tips_list_page.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;

  const TopicItem({super.key, required this.topic});

  Future<List<TipsItem>> _loadTopicTips() async {
    final String response = await rootBundle.loadString('assets/acne.json');
    final Map<String, dynamic> data = json.decode(response);
    final Map<String, dynamic> tipsList = data['TipsList'];
    final List<dynamic> topicTips = tipsList[topic.title] ?? [];

    return topicTips
        .map((tip) => TipsItem(
              tip['id'] ?? '',
              tip['title'] ?? '',
              tip['image'] ?? '',
              topic.title,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final tips = await _loadTopicTips();
        if (!context.mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipsListPage(
              topicTitle: topic.title,
              tips: tips,
            ),
          ),
        );
      },
      child: Container(
        width: 138,
        height: 180,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: topic.color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.6),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Icon(
                topic.icon,
                color: text,
                size: 30,
              ),
            ),
            const Spacer(),
            Text(
              topic.title,
              style:
                  medium14.copyWith(color: text, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              '${topic.totalTip} tips',
              style: regular10.copyWith(color: text.withOpacity(.7)),
            ),
          ],
        ),
      ),
    );
  }
}
