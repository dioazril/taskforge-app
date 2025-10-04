import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todos_provider.dart';

class AddTodoSheet extends ConsumerStatefulWidget {
  const AddTodoSheet({super.key});

  @override
  ConsumerState<AddTodoSheet> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends ConsumerState<AddTodoSheet> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _tags = TextEditingController();
  DateTime? _due;
  Priority _priority = Priority.normal;

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    _tags.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tambah Todo',
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
                        initialDate: now,
                        firstDate: DateTime(now.year - 1),
                        lastDate: DateTime(now.year + 5),
                      );
                      if (picked != null) setState(() => _due = picked);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tags,
              decoration: const InputDecoration(
                labelText: 'Tags (pisahkan dengan koma)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Simpan'),
                    onPressed: () {
                      final title = _title.text.trim();
                      if (title.isEmpty) return;
                      final tags = _tags.text
                          .split(',')
                          .map((e) => e.trim())
                          .where((e) => e.isNotEmpty)
                          .toList();

                      ref
                          .read(todosProvider.notifier)
                          .add(
                            title: title,
                            description: _desc.text.trim().isEmpty
                                ? null
                                : _desc.text.trim(),
                            dueAt: _due,
                            priority: _priority,
                            tags: tags,
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
