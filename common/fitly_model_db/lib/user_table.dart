import 'package:drift/drift.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 1, max: 50).unique()();
  TextColumn get email => text().withLength(min: 5, max: 255).unique()();
  TextColumn get passwordHash => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastLogin => dateTime().nullable()();
}

@DriftView(name: 'users_view')
abstract class UsersView extends View {
  Users get users;

  @override
  Query as() => select([
        users.id,
        users.username,
        users.email,
        users.createdAt,
        users.lastLogin,
      ]).from(users);
}
