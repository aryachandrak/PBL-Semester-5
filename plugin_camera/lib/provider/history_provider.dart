import 'package:flutter/foundation.dart';
import 'package:plugin_camera/presentation/models/history_item.dart';

class HistoryProvider with ChangeNotifier {
  final List<HistoryItem> _historyItems = [];

  List<HistoryItem> get historyItems => _historyItems;

  void addHistoryItem(
      String acneType, String deskripsi, String result, String imagePath) {
    _historyItems.add(HistoryItem(
      acneType: acneType,
      deskripsi: deskripsi,
      scanTime: DateTime.now(),
      result: result,
      imagePath: imagePath,
    ));
    notifyListeners();
  }

  void clearHistory() {
    _historyItems.clear();
    notifyListeners();
  }
}
