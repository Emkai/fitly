// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitly_db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastLoginMeta =
      const VerificationMeta('lastLogin');
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
      'last_login', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, email, passwordHash, createdAt, lastLogin];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_login')) {
      context.handle(_lastLoginMeta,
          lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String email;
  final String passwordHash;
  final DateTime createdAt;
  final DateTime? lastLogin;
  const User(
      {required this.id,
      required this.username,
      required this.email,
      required this.passwordHash,
      required this.createdAt,
      this.lastLogin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password_hash'] = Variable<String>(passwordHash);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      email: Value(email),
      passwordHash: Value(passwordHash),
      createdAt: Value(createdAt),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
    };
  }

  User copyWith(
          {int? id,
          String? username,
          String? email,
          String? passwordHash,
          DateTime? createdAt,
          Value<DateTime?> lastLogin = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        passwordHash: passwordHash ?? this.passwordHash,
        createdAt: createdAt ?? this.createdAt,
        lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, email, passwordHash, createdAt, lastLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.passwordHash == this.passwordHash &&
          other.createdAt == this.createdAt &&
          other.lastLogin == this.lastLogin);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> passwordHash;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastLogin;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastLogin = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String email,
    required String passwordHash,
    this.createdAt = const Value.absent(),
    this.lastLogin = const Value.absent(),
  })  : username = Value(username),
        email = Value(email),
        passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? passwordHash,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastLogin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (createdAt != null) 'created_at': createdAt,
      if (lastLogin != null) 'last_login': lastLogin,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? email,
      Value<String>? passwordHash,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastLogin}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, startTime, isCompleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, userId};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final int userId;
  final String name;
  final DateTime? startTime;
  final bool isCompleted;
  const Session(
      {required this.id,
      required this.userId,
      required this.name,
      this.startTime,
      required this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      isCompleted: Value(isCompleted),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  Session copyWith(
          {int? id,
          int? userId,
          String? name,
          Value<DateTime?> startTime = const Value.absent(),
          bool? isCompleted}) =>
      Session(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        startTime: startTime.present ? startTime.value : this.startTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, startTime, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.isCompleted == this.isCompleted);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<DateTime?> startTime;
  final Value<bool> isCompleted;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.startTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required int id,
    required int userId,
    required String name,
    this.startTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        name = Value(name);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<DateTime>? startTime,
    Expression<bool>? isCompleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (startTime != null) 'start_time': startTime,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? name,
      Value<DateTime?>? startTime,
      Value<bool>? isCompleted,
      Value<int>? rowid}) {
    return SessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      isCompleted: isCompleted ?? this.isCompleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sessions (id)'));
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationInSecondsMeta =
      const VerificationMeta('durationInSeconds');
  @override
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
      'duration_in_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _restDurationInSecondsMeta =
      const VerificationMeta('restDurationInSeconds');
  @override
  late final GeneratedColumn<int> restDurationInSeconds = GeneratedColumn<int>(
      'rest_duration_in_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        sessionId,
        reps,
        sets,
        durationInSeconds,
        weight,
        restDurationInSeconds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    } else if (isInserting) {
      context.missing(_setsMeta);
    }
    if (data.containsKey('duration_in_seconds')) {
      context.handle(
          _durationInSecondsMeta,
          durationInSeconds.isAcceptableOrUnknown(
              data['duration_in_seconds']!, _durationInSecondsMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('rest_duration_in_seconds')) {
      context.handle(
          _restDurationInSecondsMeta,
          restDurationInSeconds.isAcceptableOrUnknown(
              data['rest_duration_in_seconds']!, _restDurationInSecondsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, userId};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets'])!,
      durationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      restDurationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}rest_duration_in_seconds']),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final int userId;
  final int sessionId;
  final int? reps;
  final int sets;
  final int? durationInSeconds;
  final double weight;
  final int? restDurationInSeconds;
  const Exercise(
      {required this.id,
      required this.userId,
      required this.sessionId,
      this.reps,
      required this.sets,
      this.durationInSeconds,
      required this.weight,
      this.restDurationInSeconds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['session_id'] = Variable<int>(sessionId);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    map['sets'] = Variable<int>(sets);
    if (!nullToAbsent || durationInSeconds != null) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds);
    }
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || restDurationInSeconds != null) {
      map['rest_duration_in_seconds'] = Variable<int>(restDurationInSeconds);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      userId: Value(userId),
      sessionId: Value(sessionId),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      sets: Value(sets),
      durationInSeconds: durationInSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationInSeconds),
      weight: Value(weight),
      restDurationInSeconds: restDurationInSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(restDurationInSeconds),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      reps: serializer.fromJson<int?>(json['reps']),
      sets: serializer.fromJson<int>(json['sets']),
      durationInSeconds: serializer.fromJson<int?>(json['durationInSeconds']),
      weight: serializer.fromJson<double>(json['weight']),
      restDurationInSeconds:
          serializer.fromJson<int?>(json['restDurationInSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'sessionId': serializer.toJson<int>(sessionId),
      'reps': serializer.toJson<int?>(reps),
      'sets': serializer.toJson<int>(sets),
      'durationInSeconds': serializer.toJson<int?>(durationInSeconds),
      'weight': serializer.toJson<double>(weight),
      'restDurationInSeconds': serializer.toJson<int?>(restDurationInSeconds),
    };
  }

  Exercise copyWith(
          {int? id,
          int? userId,
          int? sessionId,
          Value<int?> reps = const Value.absent(),
          int? sets,
          Value<int?> durationInSeconds = const Value.absent(),
          double? weight,
          Value<int?> restDurationInSeconds = const Value.absent()}) =>
      Exercise(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        sessionId: sessionId ?? this.sessionId,
        reps: reps.present ? reps.value : this.reps,
        sets: sets ?? this.sets,
        durationInSeconds: durationInSeconds.present
            ? durationInSeconds.value
            : this.durationInSeconds,
        weight: weight ?? this.weight,
        restDurationInSeconds: restDurationInSeconds.present
            ? restDurationInSeconds.value
            : this.restDurationInSeconds,
      );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      reps: data.reps.present ? data.reps.value : this.reps,
      sets: data.sets.present ? data.sets.value : this.sets,
      durationInSeconds: data.durationInSeconds.present
          ? data.durationInSeconds.value
          : this.durationInSeconds,
      weight: data.weight.present ? data.weight.value : this.weight,
      restDurationInSeconds: data.restDurationInSeconds.present
          ? data.restDurationInSeconds.value
          : this.restDurationInSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reps: $reps, ')
          ..write('sets: $sets, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('weight: $weight, ')
          ..write('restDurationInSeconds: $restDurationInSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, sessionId, reps, sets,
      durationInSeconds, weight, restDurationInSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.sessionId == this.sessionId &&
          other.reps == this.reps &&
          other.sets == this.sets &&
          other.durationInSeconds == this.durationInSeconds &&
          other.weight == this.weight &&
          other.restDurationInSeconds == this.restDurationInSeconds);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> sessionId;
  final Value<int?> reps;
  final Value<int> sets;
  final Value<int?> durationInSeconds;
  final Value<double> weight;
  final Value<int?> restDurationInSeconds;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.reps = const Value.absent(),
    this.sets = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.weight = const Value.absent(),
    this.restDurationInSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required int id,
    required int userId,
    required int sessionId,
    this.reps = const Value.absent(),
    required int sets,
    this.durationInSeconds = const Value.absent(),
    required double weight,
    this.restDurationInSeconds = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        sessionId = Value(sessionId),
        sets = Value(sets),
        weight = Value(weight);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? sessionId,
    Expression<int>? reps,
    Expression<int>? sets,
    Expression<int>? durationInSeconds,
    Expression<double>? weight,
    Expression<int>? restDurationInSeconds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (sessionId != null) 'session_id': sessionId,
      if (reps != null) 'reps': reps,
      if (sets != null) 'sets': sets,
      if (durationInSeconds != null) 'duration_in_seconds': durationInSeconds,
      if (weight != null) 'weight': weight,
      if (restDurationInSeconds != null)
        'rest_duration_in_seconds': restDurationInSeconds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? sessionId,
      Value<int?>? reps,
      Value<int>? sets,
      Value<int?>? durationInSeconds,
      Value<double>? weight,
      Value<int?>? restDurationInSeconds,
      Value<int>? rowid}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      sessionId: sessionId ?? this.sessionId,
      reps: reps ?? this.reps,
      sets: sets ?? this.sets,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      weight: weight ?? this.weight,
      restDurationInSeconds:
          restDurationInSeconds ?? this.restDurationInSeconds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (durationInSeconds.present) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (restDurationInSeconds.present) {
      map['rest_duration_in_seconds'] =
          Variable<int>(restDurationInSeconds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reps: $reps, ')
          ..write('sets: $sets, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('weight: $weight, ')
          ..write('restDurationInSeconds: $restDurationInSeconds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UsersViewData extends DataClass {
  final int id;
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime? lastLogin;
  const UsersViewData(
      {required this.id,
      required this.username,
      required this.email,
      required this.createdAt,
      this.lastLogin});
  factory UsersViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersViewData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
    };
  }

  UsersViewData copyWith(
          {int? id,
          String? username,
          String? email,
          DateTime? createdAt,
          Value<DateTime?> lastLogin = const Value.absent()}) =>
      UsersViewData(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
      );
  @override
  String toString() {
    return (StringBuffer('UsersViewData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastLogin: $lastLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, email, createdAt, lastLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersViewData &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.createdAt == this.createdAt &&
          other.lastLogin == this.lastLogin);
}

class $UsersViewView extends ViewInfo<$UsersViewView, UsersViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $UsersViewView(this.attachedDatabase, [this._alias]);
  $UsersTable get users => attachedDatabase.users.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, email, createdAt, lastLogin];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'users_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $UsersViewView get asDslTable => this;
  @override
  UsersViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login']),
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(users.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      generatedAs: GeneratedAs(users.username, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      generatedAs: GeneratedAs(users.email, false), type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      generatedAs: GeneratedAs(users.createdAt, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
      'last_login', aliasedName, true,
      generatedAs: GeneratedAs(users.lastLogin, false),
      type: DriftSqlType.dateTime);
  @override
  $UsersViewView createAlias(String alias) {
    return $UsersViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(users)..addColumns($columns));
  @override
  Set<String> get readTables => const {'users'};
}

class SessionsByNameViewData extends DataClass {
  final int id;
  final int userId;
  final String name;
  final DateTime? startTime;
  final bool isCompleted;
  const SessionsByNameViewData(
      {required this.id,
      required this.userId,
      required this.name,
      this.startTime,
      required this.isCompleted});
  factory SessionsByNameViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionsByNameViewData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  SessionsByNameViewData copyWith(
          {int? id,
          int? userId,
          String? name,
          Value<DateTime?> startTime = const Value.absent(),
          bool? isCompleted}) =>
      SessionsByNameViewData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        startTime: startTime.present ? startTime.value : this.startTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('SessionsByNameViewData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, startTime, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionsByNameViewData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.isCompleted == this.isCompleted);
}

class $SessionsByNameViewView
    extends ViewInfo<$SessionsByNameViewView, SessionsByNameViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $SessionsByNameViewView(this.attachedDatabase, [this._alias]);
  $SessionsTable get sessions => attachedDatabase.sessions.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, startTime, isCompleted];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'sessions_by_name';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $SessionsByNameViewView get asDslTable => this;
  @override
  SessionsByNameViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionsByNameViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(sessions.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      generatedAs: GeneratedAs(sessions.userId, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(sessions.name, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      generatedAs: GeneratedAs(sessions.startTime, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      generatedAs: GeneratedAs(sessions.isCompleted, false),
      type: DriftSqlType.bool,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  @override
  $SessionsByNameViewView createAlias(String alias) {
    return $SessionsByNameViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(sessions)..addColumns($columns));
  @override
  Set<String> get readTables => const {'sessions'};
}

class SessionsByUserViewData extends DataClass {
  final int id;
  final int userId;
  final String name;
  final DateTime? startTime;
  final bool isCompleted;
  const SessionsByUserViewData(
      {required this.id,
      required this.userId,
      required this.name,
      this.startTime,
      required this.isCompleted});
  factory SessionsByUserViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionsByUserViewData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  SessionsByUserViewData copyWith(
          {int? id,
          int? userId,
          String? name,
          Value<DateTime?> startTime = const Value.absent(),
          bool? isCompleted}) =>
      SessionsByUserViewData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        startTime: startTime.present ? startTime.value : this.startTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('SessionsByUserViewData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, startTime, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionsByUserViewData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.startTime == this.startTime &&
          other.isCompleted == this.isCompleted);
}

class $SessionsByUserViewView
    extends ViewInfo<$SessionsByUserViewView, SessionsByUserViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $SessionsByUserViewView(this.attachedDatabase, [this._alias]);
  $SessionsTable get sessions => attachedDatabase.sessions.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, name, startTime, isCompleted];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'sessions_by_user';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $SessionsByUserViewView get asDslTable => this;
  @override
  SessionsByUserViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionsByUserViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(sessions.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      generatedAs: GeneratedAs(sessions.userId, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(sessions.name, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      generatedAs: GeneratedAs(sessions.startTime, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      generatedAs: GeneratedAs(sessions.isCompleted, false),
      type: DriftSqlType.bool,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  @override
  $SessionsByUserViewView createAlias(String alias) {
    return $SessionsByUserViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(sessions)..addColumns($columns));
  @override
  Set<String> get readTables => const {'sessions'};
}

class ExercisesWithSessionNameViewData extends DataClass {
  final int id;
  final int userId;
  final int sessionId;
  final int? reps;
  final int sets;
  final int? durationInSeconds;
  final double weight;
  final int? restDurationInSeconds;
  final String? exerciseInfo;
  const ExercisesWithSessionNameViewData(
      {required this.id,
      required this.userId,
      required this.sessionId,
      this.reps,
      required this.sets,
      this.durationInSeconds,
      required this.weight,
      this.restDurationInSeconds,
      this.exerciseInfo});
  factory ExercisesWithSessionNameViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesWithSessionNameViewData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      reps: serializer.fromJson<int?>(json['reps']),
      sets: serializer.fromJson<int>(json['sets']),
      durationInSeconds: serializer.fromJson<int?>(json['durationInSeconds']),
      weight: serializer.fromJson<double>(json['weight']),
      restDurationInSeconds:
          serializer.fromJson<int?>(json['restDurationInSeconds']),
      exerciseInfo: serializer.fromJson<String?>(json['exerciseInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'sessionId': serializer.toJson<int>(sessionId),
      'reps': serializer.toJson<int?>(reps),
      'sets': serializer.toJson<int>(sets),
      'durationInSeconds': serializer.toJson<int?>(durationInSeconds),
      'weight': serializer.toJson<double>(weight),
      'restDurationInSeconds': serializer.toJson<int?>(restDurationInSeconds),
      'exerciseInfo': serializer.toJson<String?>(exerciseInfo),
    };
  }

  ExercisesWithSessionNameViewData copyWith(
          {int? id,
          int? userId,
          int? sessionId,
          Value<int?> reps = const Value.absent(),
          int? sets,
          Value<int?> durationInSeconds = const Value.absent(),
          double? weight,
          Value<int?> restDurationInSeconds = const Value.absent(),
          Value<String?> exerciseInfo = const Value.absent()}) =>
      ExercisesWithSessionNameViewData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        sessionId: sessionId ?? this.sessionId,
        reps: reps.present ? reps.value : this.reps,
        sets: sets ?? this.sets,
        durationInSeconds: durationInSeconds.present
            ? durationInSeconds.value
            : this.durationInSeconds,
        weight: weight ?? this.weight,
        restDurationInSeconds: restDurationInSeconds.present
            ? restDurationInSeconds.value
            : this.restDurationInSeconds,
        exerciseInfo:
            exerciseInfo.present ? exerciseInfo.value : this.exerciseInfo,
      );
  @override
  String toString() {
    return (StringBuffer('ExercisesWithSessionNameViewData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reps: $reps, ')
          ..write('sets: $sets, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('weight: $weight, ')
          ..write('restDurationInSeconds: $restDurationInSeconds, ')
          ..write('exerciseInfo: $exerciseInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, sessionId, reps, sets,
      durationInSeconds, weight, restDurationInSeconds, exerciseInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisesWithSessionNameViewData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.sessionId == this.sessionId &&
          other.reps == this.reps &&
          other.sets == this.sets &&
          other.durationInSeconds == this.durationInSeconds &&
          other.weight == this.weight &&
          other.restDurationInSeconds == this.restDurationInSeconds &&
          other.exerciseInfo == this.exerciseInfo);
}

class $ExercisesWithSessionNameViewView extends ViewInfo<
    $ExercisesWithSessionNameViewView,
    ExercisesWithSessionNameViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $ExercisesWithSessionNameViewView(this.attachedDatabase, [this._alias]);
  $ExercisesTable get exercises => attachedDatabase.exercises.createAlias('t0');
  $SessionsTable get sessions => attachedDatabase.sessions.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        sessionId,
        reps,
        sets,
        durationInSeconds,
        weight,
        restDurationInSeconds,
        exerciseInfo
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'exercises_with_session_name';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ExercisesWithSessionNameViewView get asDslTable => this;
  @override
  ExercisesWithSessionNameViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesWithSessionNameViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets'])!,
      durationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      restDurationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}rest_duration_in_seconds']),
      exerciseInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_info']),
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.userId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sessionId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      generatedAs: GeneratedAs(exercises.reps, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sets, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
      'duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.durationInSeconds, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      generatedAs: GeneratedAs(exercises.weight, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<int> restDurationInSeconds = GeneratedColumn<int>(
      'rest_duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.restDurationInSeconds, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> exerciseInfo = GeneratedColumn<String>(
      'exercise_info', aliasedName, true,
      generatedAs: GeneratedAs(
          exercises.id.cast<String>() +
              const Constant(' (') +
              sessions.name +
              const Constant(')'),
          false),
      type: DriftSqlType.string);
  @override
  $ExercisesWithSessionNameViewView createAlias(String alias) {
    return $ExercisesWithSessionNameViewView(attachedDatabase, alias);
  }

  @override
  Query? get query => (attachedDatabase.selectOnly(exercises)
        ..addColumns($columns))
      .join([innerJoin(sessions, sessions.id.equalsExp(exercises.sessionId))]);
  @override
  Set<String> get readTables => const {'exercises', 'sessions'};
}

class ExercisesWithSessionIdViewData extends DataClass {
  final int id;
  final int userId;
  final int sessionId;
  final int? reps;
  final int sets;
  final int? durationInSeconds;
  final double weight;
  final int? restDurationInSeconds;
  const ExercisesWithSessionIdViewData(
      {required this.id,
      required this.userId,
      required this.sessionId,
      this.reps,
      required this.sets,
      this.durationInSeconds,
      required this.weight,
      this.restDurationInSeconds});
  factory ExercisesWithSessionIdViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesWithSessionIdViewData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      reps: serializer.fromJson<int?>(json['reps']),
      sets: serializer.fromJson<int>(json['sets']),
      durationInSeconds: serializer.fromJson<int?>(json['durationInSeconds']),
      weight: serializer.fromJson<double>(json['weight']),
      restDurationInSeconds:
          serializer.fromJson<int?>(json['restDurationInSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'sessionId': serializer.toJson<int>(sessionId),
      'reps': serializer.toJson<int?>(reps),
      'sets': serializer.toJson<int>(sets),
      'durationInSeconds': serializer.toJson<int?>(durationInSeconds),
      'weight': serializer.toJson<double>(weight),
      'restDurationInSeconds': serializer.toJson<int?>(restDurationInSeconds),
    };
  }

  ExercisesWithSessionIdViewData copyWith(
          {int? id,
          int? userId,
          int? sessionId,
          Value<int?> reps = const Value.absent(),
          int? sets,
          Value<int?> durationInSeconds = const Value.absent(),
          double? weight,
          Value<int?> restDurationInSeconds = const Value.absent()}) =>
      ExercisesWithSessionIdViewData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        sessionId: sessionId ?? this.sessionId,
        reps: reps.present ? reps.value : this.reps,
        sets: sets ?? this.sets,
        durationInSeconds: durationInSeconds.present
            ? durationInSeconds.value
            : this.durationInSeconds,
        weight: weight ?? this.weight,
        restDurationInSeconds: restDurationInSeconds.present
            ? restDurationInSeconds.value
            : this.restDurationInSeconds,
      );
  @override
  String toString() {
    return (StringBuffer('ExercisesWithSessionIdViewData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reps: $reps, ')
          ..write('sets: $sets, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('weight: $weight, ')
          ..write('restDurationInSeconds: $restDurationInSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, sessionId, reps, sets,
      durationInSeconds, weight, restDurationInSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisesWithSessionIdViewData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.sessionId == this.sessionId &&
          other.reps == this.reps &&
          other.sets == this.sets &&
          other.durationInSeconds == this.durationInSeconds &&
          other.weight == this.weight &&
          other.restDurationInSeconds == this.restDurationInSeconds);
}

class $ExercisesWithSessionIdViewView extends ViewInfo<
    $ExercisesWithSessionIdViewView,
    ExercisesWithSessionIdViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $ExercisesWithSessionIdViewView(this.attachedDatabase, [this._alias]);
  $ExercisesTable get exercises => attachedDatabase.exercises.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        sessionId,
        reps,
        sets,
        durationInSeconds,
        weight,
        restDurationInSeconds
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'exercises_with_session_id';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ExercisesWithSessionIdViewView get asDslTable => this;
  @override
  ExercisesWithSessionIdViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesWithSessionIdViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets'])!,
      durationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      restDurationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}rest_duration_in_seconds']),
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.userId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sessionId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      generatedAs: GeneratedAs(exercises.reps, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sets, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
      'duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.durationInSeconds, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      generatedAs: GeneratedAs(exercises.weight, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<int> restDurationInSeconds = GeneratedColumn<int>(
      'rest_duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.restDurationInSeconds, false),
      type: DriftSqlType.int);
  @override
  $ExercisesWithSessionIdViewView createAlias(String alias) {
    return $ExercisesWithSessionIdViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(exercises)..addColumns($columns));
  @override
  Set<String> get readTables => const {'exercises'};
}

class ExercisesByUserViewData extends DataClass {
  final int id;
  final int userId;
  final int sessionId;
  final int? reps;
  final int sets;
  final int? durationInSeconds;
  final double weight;
  final int? restDurationInSeconds;
  const ExercisesByUserViewData(
      {required this.id,
      required this.userId,
      required this.sessionId,
      this.reps,
      required this.sets,
      this.durationInSeconds,
      required this.weight,
      this.restDurationInSeconds});
  factory ExercisesByUserViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisesByUserViewData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      reps: serializer.fromJson<int?>(json['reps']),
      sets: serializer.fromJson<int>(json['sets']),
      durationInSeconds: serializer.fromJson<int?>(json['durationInSeconds']),
      weight: serializer.fromJson<double>(json['weight']),
      restDurationInSeconds:
          serializer.fromJson<int?>(json['restDurationInSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'sessionId': serializer.toJson<int>(sessionId),
      'reps': serializer.toJson<int?>(reps),
      'sets': serializer.toJson<int>(sets),
      'durationInSeconds': serializer.toJson<int?>(durationInSeconds),
      'weight': serializer.toJson<double>(weight),
      'restDurationInSeconds': serializer.toJson<int?>(restDurationInSeconds),
    };
  }

  ExercisesByUserViewData copyWith(
          {int? id,
          int? userId,
          int? sessionId,
          Value<int?> reps = const Value.absent(),
          int? sets,
          Value<int?> durationInSeconds = const Value.absent(),
          double? weight,
          Value<int?> restDurationInSeconds = const Value.absent()}) =>
      ExercisesByUserViewData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        sessionId: sessionId ?? this.sessionId,
        reps: reps.present ? reps.value : this.reps,
        sets: sets ?? this.sets,
        durationInSeconds: durationInSeconds.present
            ? durationInSeconds.value
            : this.durationInSeconds,
        weight: weight ?? this.weight,
        restDurationInSeconds: restDurationInSeconds.present
            ? restDurationInSeconds.value
            : this.restDurationInSeconds,
      );
  @override
  String toString() {
    return (StringBuffer('ExercisesByUserViewData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('sessionId: $sessionId, ')
          ..write('reps: $reps, ')
          ..write('sets: $sets, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('weight: $weight, ')
          ..write('restDurationInSeconds: $restDurationInSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, sessionId, reps, sets,
      durationInSeconds, weight, restDurationInSeconds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisesByUserViewData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.sessionId == this.sessionId &&
          other.reps == this.reps &&
          other.sets == this.sets &&
          other.durationInSeconds == this.durationInSeconds &&
          other.weight == this.weight &&
          other.restDurationInSeconds == this.restDurationInSeconds);
}

class $ExercisesByUserViewView
    extends ViewInfo<$ExercisesByUserViewView, ExercisesByUserViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$FitlyDatabase attachedDatabase;
  $ExercisesByUserViewView(this.attachedDatabase, [this._alias]);
  $ExercisesTable get exercises => attachedDatabase.exercises.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        sessionId,
        reps,
        sets,
        durationInSeconds,
        weight,
        restDurationInSeconds
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'exercises_by_user';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ExercisesByUserViewView get asDslTable => this;
  @override
  ExercisesByUserViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisesByUserViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      sets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sets'])!,
      durationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      restDurationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}rest_duration_in_seconds']),
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.userId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sessionId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      generatedAs: GeneratedAs(exercises.reps, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
      'sets', aliasedName, false,
      generatedAs: GeneratedAs(exercises.sets, false), type: DriftSqlType.int);
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
      'duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.durationInSeconds, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      generatedAs: GeneratedAs(exercises.weight, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<int> restDurationInSeconds = GeneratedColumn<int>(
      'rest_duration_in_seconds', aliasedName, true,
      generatedAs: GeneratedAs(exercises.restDurationInSeconds, false),
      type: DriftSqlType.int);
  @override
  $ExercisesByUserViewView createAlias(String alias) {
    return $ExercisesByUserViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(exercises)..addColumns($columns));
  @override
  Set<String> get readTables => const {'exercises'};
}

abstract class _$FitlyDatabase extends GeneratedDatabase {
  _$FitlyDatabase(QueryExecutor e) : super(e);
  $FitlyDatabaseManager get managers => $FitlyDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $UsersViewView usersView = $UsersViewView(this);
  late final $SessionsByNameViewView sessionsByName =
      $SessionsByNameViewView(this);
  late final $SessionsByUserViewView sessionsByUser =
      $SessionsByUserViewView(this);
  late final $ExercisesWithSessionNameViewView exercisesWithSessionName =
      $ExercisesWithSessionNameViewView(this);
  late final $ExercisesWithSessionIdViewView exercisesWithSessionId =
      $ExercisesWithSessionIdViewView(this);
  late final $ExercisesByUserViewView exercisesByUser =
      $ExercisesByUserViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        sessions,
        exercises,
        usersView,
        sessionsByName,
        sessionsByUser,
        exercisesWithSessionName,
        exercisesWithSessionId,
        exercisesByUser
      ];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String username,
  required String email,
  required String passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime?> lastLogin,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String> email,
  Value<String> passwordHash,
  Value<DateTime> createdAt,
  Value<DateTime?> lastLogin,
});

final class $$UsersTableReferences
    extends BaseReferences<_$FitlyDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SessionsTable, List<Session>> _sessionsRefsTable(
          _$FitlyDatabase db) =>
      MultiTypedResultKey.fromTable(db.sessions,
          aliasName: $_aliasNameGenerator(db.users.id, db.sessions.userId));

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager($_db, $_db.sessions)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
      _exercisesRefsTable(_$FitlyDatabase db) => MultiTypedResultKey.fromTable(
          db.exercises,
          aliasName: $_aliasNameGenerator(db.users.id, db.exercises.userId));

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer
    extends Composer<_$FitlyDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnFilters(column));

  Expression<bool> sessionsRefs(
      Expression<bool> Function($$SessionsTableFilterComposer f) f) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sessions,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionsTableFilterComposer(
              $db: $db,
              $table: $db.sessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> exercisesRefs(
      Expression<bool> Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$FitlyDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$FitlyDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);

  Expression<T> sessionsRefs<T extends Object>(
      Expression<T> Function($$SessionsTableAnnotationComposer a) f) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sessions,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.sessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> exercisesRefs<T extends Object>(
      Expression<T> Function($$ExercisesTableAnnotationComposer a) f) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$FitlyDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool sessionsRefs, bool exercisesRefs})> {
  $$UsersTableTableManager(_$FitlyDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            username: username,
            email: email,
            passwordHash: passwordHash,
            createdAt: createdAt,
            lastLogin: lastLogin,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            required String email,
            required String passwordHash,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            username: username,
            email: email,
            passwordHash: passwordHash,
            createdAt: createdAt,
            lastLogin: lastLogin,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {sessionsRefs = false, exercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (sessionsRefs) db.sessions,
                if (exercisesRefs) db.exercises
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sessionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._sessionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).sessionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (exercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._exercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).exercisesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$FitlyDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool sessionsRefs, bool exercisesRefs})>;
typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  required int id,
  required int userId,
  required String name,
  Value<DateTime?> startTime,
  Value<bool> isCompleted,
  Value<int> rowid,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> name,
  Value<DateTime?> startTime,
  Value<bool> isCompleted,
  Value<int> rowid,
});

final class $$SessionsTableReferences
    extends BaseReferences<_$FitlyDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$FitlyDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.sessions.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
      _exercisesRefsTable(_$FitlyDatabase db) =>
          MultiTypedResultKey.fromTable(db.exercises,
              aliasName:
                  $_aliasNameGenerator(db.sessions.id, db.exercises.sessionId));

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.sessionId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$FitlyDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> exercisesRefs(
      Expression<bool> Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$FitlyDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$FitlyDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> exercisesRefs<T extends Object>(
      Expression<T> Function($$ExercisesTableAnnotationComposer a) f) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SessionsTableTableManager extends RootTableManager<
    _$FitlyDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, $$SessionsTableReferences),
    Session,
    PrefetchHooks Function({bool userId, bool exercisesRefs})> {
  $$SessionsTableTableManager(_$FitlyDatabase db, $SessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionsCompanion(
            id: id,
            userId: userId,
            name: name,
            startTime: startTime,
            isCompleted: isCompleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int userId,
            required String name,
            Value<DateTime?> startTime = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionsCompanion.insert(
            id: id,
            userId: userId,
            name: name,
            startTime: startTime,
            isCompleted: isCompleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SessionsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false, exercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (exercisesRefs) db.exercises],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$SessionsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$SessionsTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$SessionsTableReferences._exercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SessionsTableReferences(db, table, p0)
                                .exercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.sessionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SessionsTableProcessedTableManager = ProcessedTableManager<
    _$FitlyDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, $$SessionsTableReferences),
    Session,
    PrefetchHooks Function({bool userId, bool exercisesRefs})>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  required int id,
  required int userId,
  required int sessionId,
  Value<int?> reps,
  required int sets,
  Value<int?> durationInSeconds,
  required double weight,
  Value<int?> restDurationInSeconds,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> sessionId,
  Value<int?> reps,
  Value<int> sets,
  Value<int?> durationInSeconds,
  Value<double> weight,
  Value<int?> restDurationInSeconds,
  Value<int> rowid,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$FitlyDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$FitlyDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.exercises.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SessionsTable _sessionIdTable(_$FitlyDatabase db) =>
      db.sessions.createAlias(
          $_aliasNameGenerator(db.exercises.sessionId, db.sessions.id));

  $$SessionsTableProcessedTableManager? get sessionId {
    if ($_item.sessionId == null) return null;
    final manager = $$SessionsTableTableManager($_db, $_db.sessions)
        .filter((f) => f.id($_item.sessionId!));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$FitlyDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sets => $composableBuilder(
      column: $table.sets, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationInSeconds => $composableBuilder(
      column: $table.durationInSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get restDurationInSeconds => $composableBuilder(
      column: $table.restDurationInSeconds,
      builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.sessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionsTableFilterComposer(
              $db: $db,
              $table: $db.sessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$FitlyDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sets => $composableBuilder(
      column: $table.sets, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationInSeconds => $composableBuilder(
      column: $table.durationInSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get restDurationInSeconds => $composableBuilder(
      column: $table.restDurationInSeconds,
      builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.sessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionsTableOrderingComposer(
              $db: $db,
              $table: $db.sessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$FitlyDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<int> get durationInSeconds => $composableBuilder(
      column: $table.durationInSeconds, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get restDurationInSeconds => $composableBuilder(
      column: $table.restDurationInSeconds, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.sessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.sessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$FitlyDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function({bool userId, bool sessionId})> {
  $$ExercisesTableTableManager(_$FitlyDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> sessionId = const Value.absent(),
            Value<int?> reps = const Value.absent(),
            Value<int> sets = const Value.absent(),
            Value<int?> durationInSeconds = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<int?> restDurationInSeconds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            userId: userId,
            sessionId: sessionId,
            reps: reps,
            sets: sets,
            durationInSeconds: durationInSeconds,
            weight: weight,
            restDurationInSeconds: restDurationInSeconds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int userId,
            required int sessionId,
            Value<int?> reps = const Value.absent(),
            required int sets,
            Value<int?> durationInSeconds = const Value.absent(),
            required double weight,
            Value<int?> restDurationInSeconds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            id: id,
            userId: userId,
            sessionId: sessionId,
            reps: reps,
            sets: sets,
            durationInSeconds: durationInSeconds,
            weight: weight,
            restDurationInSeconds: restDurationInSeconds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userId = false, sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$ExercisesTableReferences._userIdTable(db),
                    referencedColumn:
                        $$ExercisesTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (sessionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sessionId,
                    referencedTable:
                        $$ExercisesTableReferences._sessionIdTable(db),
                    referencedColumn:
                        $$ExercisesTableReferences._sessionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$FitlyDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function({bool userId, bool sessionId})>;

class $FitlyDatabaseManager {
  final _$FitlyDatabase _db;
  $FitlyDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
}
