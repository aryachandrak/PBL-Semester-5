import 'package:flutter/foundation.dart';
import 'package:plugin_camera/models/history_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryProvider with ChangeNotifier {
  List<HistoryItem> _historyItems = [];
  List<HistoryItem> get historyItems => _historyItems;

  Future<void> fetchHistoryFromFirestore(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('history')
          .get();

      _historyItems = snapshot.docs.map((doc) {
        final data = doc.data();
        return HistoryItem(
            acneType: data['acneType'],
            deskripsi: data['deskripsi'],
            result: data['result'],
            imagePath: data['imagePath'],
            scanTime: DateTime.parse(data['scanTime'] as String),
            documentId: doc.id);
      }).toList();

      notifyListeners();
    } catch (error) {
      print('Error fetching history: $error');
    }
  }

  void clearHistory() {
    _historyItems.clear();
    notifyListeners();
  }
}
