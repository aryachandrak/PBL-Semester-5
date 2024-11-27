class HistoryItem {
  final String acneType;
  final String deskripsi;
  final DateTime scanTime;
  final String result;
  final String imagePath;

  HistoryItem(
      {required this.acneType,
      required this.deskripsi,
      required this.scanTime,
      required this.result,
      required this.imagePath});
}
