import 'package:flutter/material.dart';
import 'package:plugin_camera/models/tips_item.dart';
import 'package:plugin_camera/widgets/popular_item.dart';

class TipsListPage extends StatelessWidget {
  final String topicTitle;
  final List<TipsItem> tips;

  const TipsListPage({Key? key, required this.topicTitle, required this.tips})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topicTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return PopularItem(tip: tip);
        },
      ),
    );
  }
}
