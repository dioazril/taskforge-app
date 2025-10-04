import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repositories/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'todos_provider.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
DriftTodoRepository todoRepository(Ref ref) =>
    DriftTodoRepository(ref.watch(appDatabaseProvider));

@riverpod
class Todos extends _$Todos {
  @override
  FutureOr<List<Todo>> build() async {
    final repo = ref.watch(todoRepositoryProvider);
    return repo.loadTodos();
  }

  Future<void> add({
    required String title,
    String? description,
    DateTime? dueAt,
    Priority priority = Priority.normal,
    List<String> tags = const [],
  }) async {
    final now = DateTime.now();
    final todo = Todo(
      id: const Uuid().v4(),
      title: title,
      description: description?.trim().isEmpty == true ? null : description,
      createdAt: now,
      updatedAt: now,
      dueAt: dueAt,
      status: Status.notStarted,
      priority: priority,
      tags: tags,
      reminders: const [],
      subtasks: const [],
      order: (state.value?.length ?? 0),
      archived: false,
      deleted: false,
    );
    await _persistAndRefresh((repo) async => await repo.upsert(todo));
  }

  Future<void> updateTodo(String cb, Todo Function(Todo t) mutate) async {
    final list = state.value ?? const [];
    final idx = list.indexWhere((t) => t.id == cb);
    if (idx == -1) return;
    final updated = [...list];
    updated[idx] = mutate(list[idx]).copyWith(updatedAt: DateTime.now());
    await _persistAndRefresh((repo) async => await repo.upsert(updated[idx]));
  }

  Future<void> hardDelete(String id) async {
    await _persistAndRefresh((repo) async => await repo.remove(id));
  }

  Future<void> setStatus(String id, Status s) => updateTodo(
    id,
    (t) => t.copyWith(
      status: s,
      completedAt: s == Status.completed ? DateTime.now() : null,
    ),
  );

  Future<void> _persistAndRefresh(
    Future<void> Function(DriftTodoRepository) op,
  ) async {
    final repo = ref.read(todoRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await op(repo);
      return await repo.loadTodos();
    });
  }
}
