import 'package:drift/drift.dart';
import 'exercise_table.dart';
import 'sessions_table.dart';
import 'user_table.dart';

part 'fitly_db.g.dart';

@DriftDatabase(tables: [
  Users,
  Exercises,
  Sessions
], views: [
  UsersView,
  SessionsByNameView,
  SessionsByUserView,
  ExercisesWithSessionNameView,
  ExercisesWithSessionIdView,
  ExercisesByUserView
])
class FitlyDatabase extends _$FitlyDatabase {
  FitlyDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // Add some default data
        await batch((b) {
          b.insert(
              users,
              UsersCompanion.insert(
                  username: 'default_user',
                  email: 'default@example.com',
                  passwordHash: 'default_hash'));
          b.insert(
              sessions,
              SessionsCompanion.insert(
                  id: 1, userId: 1, name: 'First Workout'));
          b.insert(
              exercises,
              ExercisesCompanion.insert(
                  id: 1, userId: 1, sessionId: 1, sets: 3, weight: 50.0));
        });
      },
    );
  }

  // Queries
  Stream<List<User>> get allUsers => select(users).watch();
  Stream<List<Session>> get allSessions => select(sessions).watch();
  Stream<List<Exercise>> get allExercises => select(exercises).watch();
}
