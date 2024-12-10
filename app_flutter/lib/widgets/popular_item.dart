import 'package:flutter/material.dart';
import 'package:plugin_camera/models/tips_item.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:plugin_camera/views/tip_detail_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PopularItem extends StatelessWidget {
  final TipsItem tip;

  const PopularItem({Key? key, required this.tip}) : super(key: key);

  Future<void> _navigateToDetail(BuildContext context) async {
    // Load JSON file
    final String response = await rootBundle.loadString('assets/acne.json');
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> tipsList = data['TipsList'];

    // Cari tip berdasarkan judul
    final matchedTip = tipsList.firstWhere((tipData) => tipData['title'] == tip.title);

    // Navigasi ke halaman detail
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TipDetailPage(
          title: matchedTip['title'],
          description: List<String>.from(matchedTip['description']),
          image: matchedTip['image'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        padding: const EdgeInsets.only(left: 24, bottom: 12, right: 24),
        height: 178,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFFF6F8FA),
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
                child: Image.asset(tip.image),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip.title,
                      style: medium16.copyWith(color: text),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tip.topic,
                      style: regular14.copyWith(color: textSecondary),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 36,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: const Icon(FeatherIcons.heart, size: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
