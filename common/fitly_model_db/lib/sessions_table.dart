import 'package:drift/drift.dart';
import 'user_table.dart';

@DataClassName('Session')
class Sessions extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  DateTimeColumn get startTime => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, userId};
}

@DriftView(name: 'sessions_by_name')
abstract class SessionsByNameView extends View {
  Sessions get sessions;

  @override
  Query as() => select([
        sessions.id,
        sessions.userId,
        sessions.name,
        sessions.startTime,
        sessions.isCompleted,
      ]).from(sessions);

  Expression<bool> whereNameEquals(String name) => sessions.name.equals(name);
}

@DriftView(name: 'sessions_by_user')
abstract class SessionsByUserView extends View {
  Sessions get sessions;

  @override
  Query as() => select([
        sessions.id,
        sessions.userId,
        sessions.name,
        sessions.startTime,
        sessions.isCompleted,
      ]).from(sessions);

  Expression<bool> whereUserIdEquals(int userId) =>
      sessions.userId.equals(userId);
}
