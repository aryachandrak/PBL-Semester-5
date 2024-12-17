import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/popular_item.dart';
import 'package:plugin_camera/widgets/topic_item.dart';
import 'package:plugin_camera/provider/populars.dart';
import 'package:plugin_camera/provider/topics.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tips',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) =>
                    TopicItem(topic: topics[index]),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: topics.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 24, bottom: 12),
              child: Text(
                'Most Popular',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...populars.map((tip) => PopularItem(tip: tip)),
          ],
        ),
      ),
    );
  }
}