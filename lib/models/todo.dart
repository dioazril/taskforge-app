import 'package:dart_mappable/dart_mappable.dart';

part 'todo.mapper.dart';

@MappableEnum()
enum Priority { low, normal, high, urgent }

@MappableEnum()
enum Status { notStarted, inProgress, completed, blocked, cancelled }

@MappableClass()
class ChecklistItem with ChecklistItemMappable {
  final String id;
  final String title;
  final bool done;

  const ChecklistItem({
    required this.id,
    required this.title,
    this.done = false,
  });
}

@MappableClass()
class Recurrence with RecurrenceMappable {
  // Contoh sederhana; bisa diganti struktur pattern/range bila diperlukan
  final String rule; // mis. "FREQ=WEEKLY;INTERVAL=1"

  const Recurrence({required this.rule});
}

@MappableClass()
class Todo with TodoMappable {
  final String id;
  final String title;
  final String? description;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startAt;
  final DateTime? dueAt;
  final DateTime? completedAt;

  final Status status;
  final Priority priority;

  final List<String> tags;
  final String? projectId;
  final int order;

  final bool archived;
  final bool deleted;

  final List<DateTime> reminders;
  final Recurrence? recurrence;

  final List<ChecklistItem> subtasks;

  const Todo({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.startAt,
    this.dueAt,
    this.completedAt,
    this.status = Status.notStarted,
    this.priority = Priority.normal,
    this.tags = const [],
    this.projectId,
    this.order = 0,
    this.archived = false,
    this.deleted = false,
    this.reminders = const [],
    this.recurrence,
    this.subtasks = const [],
  });
}
