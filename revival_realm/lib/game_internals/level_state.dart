import 'package:flutter/foundation.dart';

/// Tracks the filled status of the GameBoard
/// also tracks if the GameBoard has been fully filled
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;

  final List<String> foods;

  LevelState({required this.onWin, required this.foods}){
    _progress = List.filled(foods.length, false, growable: false);
  }
  
  List<bool> _progress = [];

  List<bool> get progress => _progress;

  void initializeProgress() {
    _progress = List.filled(foods.length, false, growable: false);
  }

  void setProgress(String name) {
    int ind = foods.indexOf(name);
    _progress[ind] = true;
    notifyListeners();
  }

  void evaluate() {
    bool res = true;
    for (bool b in _progress){
      if (!b){
        res = false;
        break;
      }
    }
    if (res) {
      onWin();
    }
  }

  bool checkDropped(String name) {
    int ind = foods.indexOf(name);
    return _progress[ind];
  }
}
