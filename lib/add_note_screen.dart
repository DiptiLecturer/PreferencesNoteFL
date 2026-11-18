
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void saveNote() {

    String title = titleController.text.trim();
    String description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    // Send note data to Home Screen
    Navigator.pop(context, {
      'title': title,
      'description': description,
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Note Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Note Description',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveNote,
                child: const Text('Save Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
