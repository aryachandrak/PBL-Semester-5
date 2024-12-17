import 'package:flutter/material.dart';
import '../models/routine.dart';

class RoutineProvider extends ChangeNotifier {
  List<Routine> _routines = [];

  List<Routine> get routines => _routines;

  void addRoutine(Routine routine) {
    _routines.add(routine);
    notifyListeners();
  }

  void updateRoutine(Routine routine, int index) {
    _routines[index] = routine;
    notifyListeners();
  }

  void deleteRoutine(int index) {
    _routines.removeAt(index);
    notifyListeners();
  }

  void toggleReminder(int routineIndex, bool value) {
    _routines[routineIndex].reminder = value;
    notifyListeners();
  }
}
