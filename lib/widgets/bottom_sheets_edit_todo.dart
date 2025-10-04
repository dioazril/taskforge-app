import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todos_provider.dart';

class EditTodoSheet extends ConsumerStatefulWidget {
  const EditTodoSheet({super.key, required this.todo});
  final Todo todo;

  @override
  ConsumerState<EditTodoSheet> createState() => _EditTodoSheetState();
}

class _EditTodoSheetState extends ConsumerState<EditTodoSheet> {
  late final TextEditingController _title = TextEditingController(
    text: widget.todo.title,
  );
  late final TextEditingController _desc = TextEditingController(
    text: widget.todo.description ?? '',
  );
  late Priority _priority = widget.todo.priority;
  DateTime? _due;

  @override
  void initState() {
    super.initState();
    _due = widget.todo.dueAt;
  }

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final notifier = ref.read(todosProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Edit Todo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _desc,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<Priority>(
                    initialValue: _priority,
                    onChanged: (p) =>
                        setState(() => _priority = p ?? Priority.normal),
                    items: const [
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
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.event),
                    label: Text(
                      _due == null ? 'Set due date' : _fmtDate(_due!),
                    ),
                    onPressed: () async {
                      final now = DateTime.now();
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _due ?? now,
                        firstDate: DateTime(now.year - 1),
                        lastDate: DateTime(now.year + 5),
                      );
                      if (picked != null) setState(() => _due = picked);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Simpan'),
                    onPressed: () {
                      final id = widget.todo.id;
                      final title = _title.text.trim();
                      if (title.isEmpty) return;
                      notifier.updateTodo(
                        id,
                        (t) => t.copyWith(
                          title: title,
                          description: _desc.text.trim().isEmpty
                              ? null
                              : _desc.text.trim(),
                          priority: _priority,
                          dueAt: _due,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _fmtDate(DateTime d) {
    String two(int x) => x.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)}';
  }
}
