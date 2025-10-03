// lib/features/todo/application/filters.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo.dart';
import 'providers.dart';

part 'filters.g.dart';

enum SortMode { byOrder, byDue, byPriority, byUpdated }

@riverpod
class StatusFilter extends _$StatusFilter {
  @override
  Status? build() => null; // null = semua
  void set(Status? value) => state = value;
}

@riverpod
class PriorityFilter extends _$PriorityFilter {
  @override
  Priority? build() => null;
  void set(Priority? value) => state = value;
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';
  void set(String value) => state = value;
}

@riverpod
class Sorter extends _$Sorter {
  @override
  SortMode build() => SortMode.byOrder;
  void set(SortMode mode) => state = mode;
}

@riverpod
List<Todo> filteredTodos(Ref ref) {
  final todos = ref.watch(todosProvider);
  final sf = ref.watch(statusFilterProvider);
  final pf = ref.watch(priorityFilterProvider);
  final q = ref.watch(searchQueryProvider).trim().toLowerCase();
  final sort = ref.watch(sorterProvider);

  return todos.when(
    data: (todoList) {
      List<Todo> list = todoList.where((t) {
        final okStatus = sf == null || t.status == sf;
        final okPriority = pf == null || t.priority == pf;
        final okQuery =
            q.isEmpty ||
            t.title.toLowerCase().contains(q) ||
            (t.description?.toLowerCase().contains(q) ?? false) ||
            t.tags.any((tag) => tag.toLowerCase().contains(q));
        return okStatus && okPriority && okQuery;
      }).toList();

      int byDue(Todo a, Todo b) =>
          (a.dueAt ?? DateTime.fromMillisecondsSinceEpoch(0)).compareTo(
            b.dueAt ?? DateTime.fromMillisecondsSinceEpoch(0),
          );
      int byPriority(Todo a, Todo b) =>
          a.priority.index.compareTo(b.priority.index);
      int byUpdated(Todo a, Todo b) => a.updatedAt.compareTo(b.updatedAt);

      switch (sort) {
        case SortMode.byOrder:
          list.sort((a, b) => a.order.compareTo(b.order));
          break;
        case SortMode.byDue:
          list.sort(byDue);
          break;
        case SortMode.byPriority:
          list.sort(byPriority);
          break;
        case SortMode.byUpdated:
          list.sort(byUpdated);
          break;
      }
      return list;
    },
    loading: () => [],
    error: (err, stack) => [],
  );
}
