import 'package:drift/drift.dart';
import 'app_database.dart';

part 'daos.g.dart';

@DriftAccessor(tables: [Todos, ChecklistItems])
class TodosDao extends DatabaseAccessor<AppDatabase> with _$TodosDaoMixin {
  TodosDao(super.db);

  Future<List<TodoRow>> all() =>
      (select(todos)..orderBy([(t) => OrderingTerm.asc(t.order)])).get();
  Stream<List<TodoRow>> watchAll() =>
      (select(todos)..orderBy([(t) => OrderingTerm.asc(t.order)])).watch();

  Future<void> insertTodo(TodosCompanion entry) => into(todos).insert(entry);
  Future<void> updateTodo(TodosCompanion entry) => update(todos).replace(entry);
  Future<void> deleteTodo(String id) =>
      (delete(todos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [ChecklistItems])
class ChecklistDao extends DatabaseAccessor<AppDatabase>
    with _$ChecklistDaoMixin {
  ChecklistDao(super.db);

  Future<List<ChecklistItemRow>> byTodoId(String todoId) =>
      (select(checklistItems)..where((c) => c.todoId.equals(todoId))).get();

  Stream<List<ChecklistItemRow>> watchByTodoId(String todoId) =>
      (select(checklistItems)..where((c) => c.todoId.equals(todoId))).watch();

  Future<void> insertItem(ChecklistItemsCompanion e) =>
      into(checklistItems).insert(e);
  Future<void> toggle(String id, bool done) =>
      (update(checklistItems)..where((c) => c.id.equals(id))).write(
        ChecklistItemsCompanion(done: Value(done)),
      );
  Future<void> remove(String id) =>
      (delete(checklistItems)..where((c) => c.id.equals(id))).go();
}
