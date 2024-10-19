import 'package:flutter/foundation.dart';
import 'session.dart';

class FitlyController extends ChangeNotifier {
  List<Session> _sessions = [];
  Session? _currentSession;

  List<Session> get sessions => _sessions;
  Session? get currentSession => _currentSession;

  void loadSessions(List<Session> sessions) {
    _sessions = sessions;
    notifyListeners();
  }

  void startSession(int index) {
    if (index >= 0 && index < _sessions.length) {
      _currentSession = _sessions[index];
      _currentSession!.startSession();
      _currentSession!.setOnRestOverCallback(() {
        notifyListeners();
      });
      notifyListeners();
    }
  }

  void completeCurrentExercise() {
    _currentSession?.completeCurrentExercise();
    notifyListeners();
  }

  void postponeCurrentExercise() {
    _currentSession?.postponeExercise();
    notifyListeners();
  }

  void abortCurrentExerciseRest() {
    _currentSession?.abortCurrentExerciseRest();
    notifyListeners();
  }

  bool isCurrentExerciseResting() {
    return _currentSession?.isCurrentExerciseResting() ?? false;
  }


  bool isSessionComplete() {
    return _currentSession?.getCurrentExercise() == null;
  }

  void endSession() {
    _currentSession = null;
    notifyListeners();
  }
}
