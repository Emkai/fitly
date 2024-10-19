import 'dart:async';

class Exercise {
  final int? reps;
  final int sets;
  final Duration? duration;
  final double weight;
  final Duration? restDuration;
  
  bool _isCompleted = false;
  bool _isResting = false;
  Function? _onRestOver;
  Timer? _restTimer;

  Exercise({
    this.reps,
    required this.sets,
    this.duration,
    required this.weight,
    this.restDuration,
  }) : assert(reps != null || duration != null,
            'Either reps or duration must be provided');

  bool get isResting => _isResting;

  bool willRestOnComplete() {
    return restDuration != null;
  }

  void complete() {
    if (_isCompleted) {
      return;
    }
    _isCompleted = true;
    if (willRestOnComplete()) {
      _startRestTimer();
    }
  }

  void setOnRestOver(Function callback) {
    _onRestOver = callback;
  }

  void _startRestTimer() {
    _isResting = true;
    _restTimer = Timer(restDuration!, () {
      _isResting = false;
      _onRestOver?.call();
      _restTimer = null;
    });
  }

  void abortRest() {
    _restTimer?.cancel();
    _restTimer = null;
    _isResting = false;
  }
}
