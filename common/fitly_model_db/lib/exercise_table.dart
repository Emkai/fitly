import 'package:drift/drift.dart';
import 'package:fitly_model_db/sessions_table.dart';
import 'package:fitly_model_db/user_table.dart';

@DataClassName('Exercise')
class Exercises extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get sessionId => integer().references(Sessions, #id)();
  IntColumn get reps => integer().nullable()();
  IntColumn get sets => integer()();
  IntColumn get durationInSeconds => integer().nullable()();
  RealColumn get weight => real()();
  IntColumn get restDurationInSeconds => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id, userId};
}

@DriftView(name: 'exercises_with_session_name')
abstract class ExercisesWithSessionNameView extends View {
  Exercises get exercises;
  Sessions get sessions;

  Expression<String> get exerciseInfo =>
      exercises.id.cast<String>() +
      const Constant(' (') +
      sessions.name +
      const Constant(')');

  @override
  Query as() => select([
        exercises.id,
        exercises.userId,
        exercises.sessionId,
        exercises.reps,
        exercises.sets,
        exercises.durationInSeconds,
        exercises.weight,
        exercises.restDurationInSeconds,
        exerciseInfo,
      ]).from(exercises).join(
          [innerJoin(sessions, sessions.id.equalsExp(exercises.sessionId))]);
}

@DriftView(name: 'exercises_with_session_id')
abstract class ExercisesWithSessionIdView extends View {
  Exercises get exercises;

  @override
  Query as() => select([
        exercises.id,
        exercises.userId,
        exercises.sessionId,
        exercises.reps,
        exercises.sets,
        exercises.durationInSeconds,
        exercises.weight,
        exercises.restDurationInSeconds,
      ]).from(exercises);

  Expression<bool> whereSessionIdEquals(int sessionId) =>
      exercises.sessionId.equals(sessionId);
}

@DriftView(name: 'exercises_by_user')
abstract class ExercisesByUserView extends View {
  Exercises get exercises;

  @override
  Query as() => select([
        exercises.id,
        exercises.userId,
        exercises.sessionId,
        exercises.reps,
        exercises.sets,
        exercises.durationInSeconds,
        exercises.weight,
        exercises.restDurationInSeconds,
      ]).from(exercises);

  Expression<bool> whereUserIdEquals(int userId) =>
      exercises.userId.equals(userId);
}
