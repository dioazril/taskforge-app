import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/todo.dart';

part 'app_database.g.dart';

// TypeConverters
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb) =>
      (jsonDecode(fromDb) as List).map((e) => e.toString()).toList();
  @override
  String toSql(List<String> value) => jsonEncode(value);
}

class DateTimeListConverter extends TypeConverter<List<DateTime>, String> {
  const DateTimeListConverter();
  @override
  List<DateTime> fromSql(String fromDb) => (jsonDecode(fromDb) as List)
      .map((e) => DateTime.parse(e as String))
      .toList();
  @override
  String toSql(List<DateTime> value) =>
      jsonEncode(value.map((d) => d.toIso8601String()).toList());
}

class StatusConverter extends TypeConverter<Status, String> {
  const StatusConverter();
  @override
  Status fromSql(String fromDb) =>
      Status.values.firstWhere((e) => e.name == fromDb);
  @override
  String toSql(Status value) => value.name;
}

class PriorityConverter extends TypeConverter<Priority, String> {
  const PriorityConverter();
  @override
  Priority fromSql(String fromDb) =>
      Priority.values.firstWhere((e) => e.name == fromDb);
  @override
  String toSql(Priority value) => value.name;
}

@DataClassName('TodoRow')
class Todos extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get startAt => dateTime().nullable()();
  DateTimeColumn get dueAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get status => text().map(const StatusConverter())();
  TextColumn get priority => text().map(const PriorityConverter())();
  TextColumn get tags => text().map(const StringListConverter())();
  TextColumn get projectId => text().nullable()();
  IntColumn get order => integer().withDefault(const Constant(0))();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get reminders => text().map(const DateTimeListConverter())();
  TextColumn get recurrenceRule => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ChecklistItemRow')
class ChecklistItems extends Table {
  TextColumn get id => text()();
  TextColumn get todoId =>
      text().references(Todos, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Todos, ChecklistItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // web: DriftWebOptions(
      //   sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      //   driftWorker: Uri.parse('drift_worker.dart.js'),
      //   onResult: (result) {
      //     if (result.missingFeatures.isNotEmpty) {
      //       debugPrint(
      //         'Using ${result.chosenImplementation} due to unsupported '
      //         'browser features: ${result.missingFeatures}',
      //       );
      //     }
      //   },
      // ),
    );
  }

  // DatabaseConnection conncectOnWeb() {
  //   return DatabaseConnection.delayed(
  //     Future(() async {
  //       final result = await WasmDatabase.open(
  //         databaseName: 'my_app_db',
  //         sqlite3Uri: Uri.parse('sqlite3.wasm'),
  //         driftWorkerUri: Uri.parse('drift_worker.dart.js'),
  //       );
  //       if (result.missingFeatures.isNotEmpty) {
  //         // Depending how central local persistence is to your app, you may want
  //         // to show a warning to the user if only unrealiable implemetentations
  //         // are available.
  //         print(
  //           'Using ${result.chosenImplementation} due to missing browser '
  //           'features: ${result.missingFeatures}',
  //         );
  //       }
  //       return result.resolvedExecutor;
  //     }),
  //   );
  // }
}
