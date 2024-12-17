class RoutineStep {
  final String stepName; // Nama langkah (Pembersih, Toner, dsb)
  String? product; // Produk yang ditambahkan (nullable)

  RoutineStep({required this.stepName, this.product});
}

class Routine {
  String name; // Nama rutinitas
  List<RoutineStep> steps; // Daftar langkah rutinitas
  List<String> days; // Hari untuk rutinitas (e.g., Min, Sen, Sel)
  String time; // Waktu rutinitas: "Pagi", "Malam", "Kapan saja"
  bool reminder; // Ingatkan pengguna

  Routine({
    required this.name,
    required this.steps,
    required this.days,
    this.time = 'Kapan saja',
    this.reminder = false,
  });
}
