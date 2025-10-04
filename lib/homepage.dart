import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/filters.dart';
import 'package:todo_app/providers/todos_provider.dart';
import 'package:todo_app/widgets/bottom_sheets_add_todo.dart';
import 'package:todo_app/widgets/bottom_sheets_edit_todo.dart';

class TodoHomePage extends ConsumerStatefulWidget {
  const TodoHomePage({super.key});

  @override
  ConsumerState<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends ConsumerState<TodoHomePage> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(filteredTodosProvider);
    final status = ref.watch(statusFilterProvider);
    final priority = ref.watch(priorityFilterProvider);
    final sortMode = ref.watch(sorterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          PopupMenuButton<SortMode>(
            initialValue: sortMode,
            onSelected: (m) => ref.read(sorterProvider.notifier).set(m),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: SortMode.byOrder,
                child: Text('Sort by order'),
              ),
              PopupMenuItem(value: SortMode.byDue, child: Text('Sort by due')),
              PopupMenuItem(
                value: SortMode.byPriority,
                child: Text('Sort by priority'),
              ),
              PopupMenuItem(
                value: SortMode.byUpdated,
                child: Text('Sort by updated'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddTodoSheet(context),
            tooltip: 'Add',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                hintText: 'Cari judul, deskripsi, atau tag…',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (q) => ref.read(searchQueryProvider.notifier).set(q),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<Status?>(
                    initialValue: status,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) =>
                        ref.read(statusFilterProvider.notifier).set(v),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('Semua')),
                      DropdownMenuItem(
                        value: Status.notStarted,
                        child: Text('Not started'),
                      ),
                      DropdownMenuItem(
                        value: Status.inProgress,
                        child: Text('In progress'),
                      ),
                      DropdownMenuItem(
                        value: Status.completed,
                        child: Text('Completed'),
                      ),
                      DropdownMenuItem(
                        value: Status.blocked,
                        child: Text('Blocked'),
                      ),
                      DropdownMenuItem(
                        value: Status.cancelled,
                        child: Text('Cancelled'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<Priority?>(
                    initialValue: priority,
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) =>
                        ref.read(priorityFilterProvider.notifier).set(v),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('Semua')),
                      DropdownMenuItem(value: Priority.low, child: Text('Low')),
                      DropdownMenuItem(
                        value: Priority.normal,
                        child: Text('Normal'),
                      ),
                      DropdownMenuItem(
                        value: Priority.high,
                        child: Text('High'),
                      ),
                      DropdownMenuItem(
                        value: Priority.urgent,
                        child: Text('Urgent'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: todos.isEmpty
                  ? const _EmptyState()
                  : ListView.builder(
                      key: ValueKey(todos.length),
                      itemCount: todos.length,
                      itemBuilder: (context, i) {
                        final t = todos[i];
                        return _TodoTile(todo: t);
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddTodoSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }

  Future<void> _openAddTodoSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const AddTodoSheet(),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.inbox_outlined, size: 48),
            SizedBox(height: 8),
            Text('Belum ada tugas'),
            SizedBox(height: 4),
            Text('Tambah tugas dengan tombol +'),
          ],
        ),
      ),
    );
  }
}

class _TodoTile extends ConsumerWidget {
  const _TodoTile({required this.todo});
  final Todo todo;

  Color _priorityColor(Priority p, BuildContext c) {
    switch (p) {
      case Priority.low:
        return Colors.blueAccent;
      case Priority.normal:
        return Colors.green;
      case Priority.high:
        return Colors.orange;
      case Priority.urgent:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(todosProvider.notifier);
    return Dismissible(
      key: ValueKey(todo.id),
      background: Container(
        color: Colors.red.withValues(),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete_outline, color: Colors.red),
      ),
      secondaryBackground: Container(
        color: Colors.red.withValues(),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete_outline, color: Colors.red),
      ),
      onDismissed: (_) => notifier.hardDelete(todo.id),
      child: ListTile(
        leading: Checkbox(
          value: todo.status == Status.completed,
          onChanged: (_) => notifier.setStatus(
            todo.id,
            todo.status == Status.completed
                ? Status.notStarted
                : Status.completed,
          ),
        ),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            todo.title,
            key: ValueKey('${todo.title}-${todo.status}'),
            style: TextStyle(
              decoration: todo.status == Status.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (todo.description != null && todo.description!.isNotEmpty)
              Text(todo.description!),
            Wrap(
              spacing: 6,
              runSpacing: -8,
              children: [
                if (todo.dueAt != null)
                  Chip(
                    label: Text('Due: ${_fmtDate(todo.dueAt!)}'),
                    visualDensity: VisualDensity.compact,
                  ),
                Chip(
                  label: Text(
                    todo.priority.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _priorityColor(
                    todo.priority,
                    context,
                  ).withValues(),
                  side: BorderSide(
                    color: _priorityColor(todo.priority, context),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                ...todo.tags.map(
                  (tag) => Chip(
                    label: Text('#$tag'),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => _openEditSheet(context, ref, todo),
        ),
      ),
    );
  }

  String _fmtDate(DateTime d) {
    String two(int x) => x.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)}';
  }

  Future<void> _openEditSheet(
    BuildContext context,
    WidgetRef ref,
    Todo t,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => EditTodoSheet(todo: t),
    );
  }
}
