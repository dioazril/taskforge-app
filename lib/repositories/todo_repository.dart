import 'package:drift/drift.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/database/daos.dart';
import 'package:todo_app/models/todo.dart';

class DriftTodoRepository {
  DriftTodoRepository(this.db)
    : todosDao = TodosDao(db),
      checklistDao = ChecklistDao(db);
  final AppDatabase db;
  final TodosDao todosDao;
  final ChecklistDao checklistDao;

  Future<List<Todo>> loadTodos() async {
    final rows = await todosDao.all();
    final allSubs = await (db.select(db.checklistItems)).get();
    final byTodo = <String, List<ChecklistItemRow>>{};
    for (final s in allSubs) {
      byTodo.putIfAbsent(s.todoId, () => []).add(s);
    }
    return rows.map((r) => _toDomain(r, byTodo[r.id] ?? const [])).toList();
  }

  Future<void> upsert(Todo t) async {
    await db.into(db.todos).insertOnConflictUpdate(_toCompanion(t));
    // sinkronisasi subtasks sederhana: hapus semua lalu insert ulang (optimalkan sesuai kebutuhan)
    await (db.delete(
      db.checklistItems,
    )..where((c) => c.todoId.equals(t.id))).go();
    for (final s in t.subtasks) {
      await db
          .into(db.checklistItems)
          .insert(
            ChecklistItemsCompanion.insert(
              id: s.id,
              todoId: t.id,
              title: s.title,
              done: Value(s.done),
            ),
          );
    }
  }

  Future<void> remove(String id) => todosDao.deleteTodo(id);

  // Mapping
  TodosCompanion _toCompanion(Todo t) {
    return TodosCompanion(
      id: Value(t.id),
      title: Value(t.title),
      description: Value(t.description),
      createdAt: Value(t.createdAt),
      updatedAt: Value(t.updatedAt),
      startAt: Value(t.startAt),
      dueAt: Value(t.dueAt),
      completedAt: Value(t.completedAt),
      status: Value(t.status),
      priority: Value(t.priority),
      tags: Value(t.tags),
      projectId: Value(t.projectId),
      order: Value(t.order),
      archived: Value(t.archived),
      deleted: Value(t.deleted),
      reminders: Value(t.reminders),
      recurrenceRule: Value(t.recurrence?.rule),
    );
  }

  Todo _toDomain(TodoRow r, List<ChecklistItemRow> subs) {
    return Todo(
      id: r.id,
      title: r.title,
      description: r.description,
      createdAt: r.createdAt,
      updatedAt: r.updatedAt,
      startAt: r.startAt,
      dueAt: r.dueAt,
      completedAt: r.completedAt,
      status: r.status,
      priority: r.priority,
      tags: r.tags,
      projectId: r.projectId,
      order: r.order,
      archived: r.archived,
      deleted: r.deleted,
      reminders: r.reminders,
      recurrence: r.recurrenceRule == null
          ? null
          : Recurrence(rule: r.recurrenceRule!),
      subtasks: subs
          .map((s) => ChecklistItem(id: s.id, title: s.title, done: s.done))
          .toList(),
    );
  }
}
