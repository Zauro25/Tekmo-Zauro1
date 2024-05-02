import 'package:flutter/material.dart';
import 'package:modul_3/components/note_card.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteState = context.watch<NoteProvider>();
    final noteList = noteState.noteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<NoteProvider>(
          builder: (context, value, child) {
            if (noteList.isEmpty) {
              return const Center(
                child: Text("No Notes Added Yet"),
              );
            }
            return GridView.builder(
              itemCount: noteList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => NoteCard(
                note: noteList[index].note,
                title: noteList[index].title,
                description: noteList[index].description,
              ),
            );
          },
        ),
      ),
    );
  }
}
