import 'package:flutter/foundation.dart';
import 'exercise.dart';

class Session extends ChangeNotifier {
  final String name;
  DateTime? dateTime;
  final List<Exercise> exercises;
  Exercise? _currentExercise;
  Function? _onRestOverCallback;

  Session({
    required this.name,
    required this.exercises,
    this.dateTime,
  });

  void setOnRestOverCallback(Function callback) {
    _onRestOverCallback = callback;
  }

  void startSession() {
    if (exercises.isNotEmpty) {
      _currentExercise = exercises.first;
      dateTime = DateTime.now();
      notifyListeners();
    }
  }

  Exercise? getCurrentExercise() {
    return _currentExercise;
  }

  void completeCurrentExercise() {
    if (_currentExercise != null) {
      _currentExercise!.complete();
      if (_currentExercise!.willRestOnComplete()) {
        _currentExercise!.setOnRestOver(() {
          _moveToNextExercise();
          _onRestOverCallback?.call();
        });
      } else {
        _moveToNextExercise();
      }
      notifyListeners();
    }
  }

  void _moveToNextExercise() {
    final currentIndex = exercises.indexOf(_currentExercise!);
    if (currentIndex < exercises.length - 1) {
      _currentExercise = exercises[currentIndex + 1];
      notifyListeners();
    }
  }

  void postponeExercise() {
    if (_currentExercise != null) {
      final currentIndex = exercises.indexOf(_currentExercise!);
      if (currentIndex < exercises.length - 1) {
        final postponedExercise = exercises.removeAt(currentIndex);
        exercises.add(postponedExercise);
        _currentExercise = exercises[currentIndex];
        notifyListeners();
      }
    }
  }

  bool isCurrentExerciseResting() {
    return _currentExercise?.isResting ?? false;
  }

  void abortCurrentExerciseRest() {
    if (_currentExercise != null) {
      _currentExercise!.abortRest();
      _moveToNextExercise();
      notifyListeners();
    }
  }
}
