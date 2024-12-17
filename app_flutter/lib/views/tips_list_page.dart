import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_camera/models/tips_item.dart';
import 'package:plugin_camera/views/tip_detail_page.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipsListPage extends StatefulWidget {
  final String topicTitle;
  final List<TipsItem> tips;

  const TipsListPage({
    super.key,
    required this.topicTitle,
    required this.tips,
  });

  @override
  State<TipsListPage> createState() => _TipsListPageState();
}

class _TipsListPageState extends State<TipsListPage> {
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Track favorite state for each tip
  final Map<String, bool> _favorites = {};
  final List<TipsItem> favoriteTips = [];

  void _toggleFavorite(TipsItem tip) {
    setState(() {
      if (_favorites[tip.title] ?? false) {
        _favorites[tip.title] = false;
        favoriteTips.removeWhere((item) => item.title == tip.title);
      } else {
        _favorites[tip.title] = true;
        favoriteTips.add(tip);
      }
      _saveFavorites();
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> encodedTips = favoriteTips
        .map((tip) => json.encode({
              'topic': tip.topic,
              'title': tip.title,
              'image': tip.image,
            }))
        .toList();

    await prefs.setStringList('favorieTips', encodedTips);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedTips = prefs.getStringList('favoriteTips');

    if (encodedTips != null) {
      setState(() {
        favoriteTips.clear();
        for (String encodedTip in encodedTips) {
          final Map<String, dynamic> tipMap = json.decode(encodedTip);
          final tip = TipsItem(
            tipMap['topic'],
            tipMap['title'],
            tipMap['image'],
            '',
          );
          favoriteTips.add(tip);
          _favorites[tip.title] = true;
        }
      });
    }
  }

  Future<void> _navigateToDetail(BuildContext context, TipsItem tip) async {
    final String response = await rootBundle.loadString('assets/acne.json');
    final Map<String, dynamic> data = json.decode(response);
    final Map<String, dynamic> tipsList = data['TipsList'];
    final List<dynamic> topicTips = tipsList[widget.topicTitle] ?? [];

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

  // Future<void> _navigateToDetail(BuildContext context, TipsItem tip) async {
  //   final String response = await rootBundle.loadString('assets/acne.json');
  //   final Map<String, dynamic> data = json.decode(response);
  //   final Map<String, dynamic> tipsList = data['TipsList'];
  //   final List<dynamic> topicTips = tipsList[topicTitle] ?? [];

  //   final matchedTip = topicTips.firstWhere(
  //     (tipData) => tipData['title'] == tip.title,
  //   );

  //   if (!context.mounted) return;

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => TipDetailPage(
  //         topicTitle: tip.topic,
  //         title: matchedTip['title'],
  //         explanation: matchedTip['description']['explanation'],
  //         image: matchedTip['image'],
  //         causes: List<String>.from(matchedTip['description']['causes']),
  //         treatment:
  //             List<String>.from(matchedTip['description']['how_to_overcome']),
  //         dailyRoutine:
  //             List<String>.from(matchedTip['description']['daily_routines']),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topicTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.tips.length,
        itemBuilder: (context, index) {
          final tip = widget.tips[index];
          return GestureDetector(
            onTap: () => _navigateToDetail(context, tip),
            child: Container(
              padding: const EdgeInsets.only(left: 24, bottom: 12, right: 24),
              height: 120,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  border: Border.all(
                    color: primary,
                    width: 1.5,
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tip.title,
                                style: medium16.copyWith(color: text),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.topicTitle,
                                style: regular14.copyWith(color: textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      bottom: -10,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          _favorites[tip.title] ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _favorites[tip.title] ?? false
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () => _toggleFavorite(tip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
