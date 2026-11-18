
import 'package:flutter/material.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Store notes temporarily
  List<Map<String, String>> notes = [];

  // Open Add Note Screen
  void openAddNote() async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNoteScreen(),
      ),
    );

    // Receive note data
    if (result != null) {
      setState(() {
        notes.add(result);
      });
    }
  }

  // Delete note
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
      ),

      body: notes.isEmpty
          ? const Center(
        child: Text(
          'No notes available!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                notes[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                notes[index]['description']!,
              ),

              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  deleteNote(index);
                },
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
