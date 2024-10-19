import 'package:fitly_model/exercise.dart';
import 'package:fitly_model/session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exercise Model Tests', () {
    test('Exercise creation', () {
      final exercise = Exercise(
        reps: 10,
        sets: 3,
        duration: const Duration(minutes: 1),
        weight: 100,
        restDuration: const Duration(seconds: 30),
      );
      expect(exercise.reps, 10);
      expect(exercise.sets, 3);
      expect(exercise.duration, const Duration(minutes: 1));
      expect(exercise.weight, 100);
      expect(exercise.restDuration, const Duration(seconds: 30));
    });

    test('Exercise completion and rest', () {
      final exercise = Exercise(
        reps: 10,
        sets: 3,
        duration: const Duration(minutes: 1),
        weight: 100,
        restDuration: const Duration(seconds: 1),
      );
      expect(exercise.isResting, false);
      exercise.complete();
      expect(exercise.isResting, true);

      // Wait for rest to be over
      expectLater(
        Stream.periodic(
                const Duration(milliseconds: 100), (_) => exercise.isResting)
            .takeWhile((isResting) => isResting == true),
        emitsInOrder([
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          true,
          false
        ]),
      );
    });
  });

  group('Session Model Tests', () {
    test('Session creation and exercise management', () {
      final exercises = [
        Exercise(
            reps: 10,
            sets: 3,
            duration: const Duration(minutes: 1),
            weight: 100),
        Exercise(
            reps: 15,
            sets: 4,
            duration: const Duration(minutes: 2),
            weight: 50),
        Exercise(
            reps: 20,
            sets: 5,
            duration: const Duration(minutes: 3),
            weight: 75),
      ];
      final session = Session(name: 'Test Session', exercises: exercises);

      expect(session.exercises.length, 3);
      expect(session.getCurrentExercise(), null);

      session.startSession();
      expect(session.getCurrentExercise(), exercises[0]);

      session.completeCurrentExercise();
      expect(session.getCurrentExercise(), exercises[1]);

      session.postponeExercise();
      expect(session.getCurrentExercise(), exercises[1]);
      expect(session.exercises.last, exercises[0]);
    });

    test('Session with resting exercises', () {
      final exercises = [
        Exercise(
            reps: 10,
            sets: 3,
            duration: const Duration(minutes: 1),
            weight: 100,
            restDuration: const Duration(seconds: 1)),
        Exercise(
            reps: 15,
            sets: 4,
            duration: const Duration(minutes: 2),
            weight: 50),
      ];
      final session = Session(name: 'Test Session', exercises: exercises);

      session.startSession();
      expect(session.isCurrentExerciseResting(), false);

      session.completeCurrentExercise();
      expect(session.isCurrentExerciseResting(), true);

      // Wait for rest to be over
      expectLater(
        Stream.periodic(const Duration(milliseconds: 100),
                (_) => session.isCurrentExerciseResting())
            .takeWhile((isResting) => isResting == true),
        emitsInOrder([true, true, false]),
      );

      // After rest, it should move to the next exercise
      expect(session.getCurrentExercise(), exercises[1]);
    });
  });
}
