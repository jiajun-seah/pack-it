import 'package:flutter/foundation.dart';

/// Tracks the filled status of the GameBoard, also tracks if the GameBoard has been successfully filled
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;

  final int goal;

  LevelState({required this.onWin, this.goal = 100});

  int _progress = 0;

  int get progress => _progress;

  void setProgress(int value) {
    _progress = value;
    notifyListeners();
  }

  void evaluate() {
    if (_progress >= goal) {
      onWin();
    }
  }
}
