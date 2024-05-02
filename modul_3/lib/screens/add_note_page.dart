import 'package:flutter/material.dart';
import 'package:modul_3/models/note_model.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final noteState = context.watch<NoteProvider>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController noteController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Note!"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Let's start adding your new note here!"),
            const SizedBox(height: 24),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: "Notes",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final title = titleController.text.trim();
                  final note = noteController.text.trim();
                  final description = descriptionController.text.trim();

                  if (description.isNotEmpty) {
                    final NoteModel addNote = NoteModel(
                      title: title,
                      note: note,
                      description: description,
                    );
                    noteState.addNote(addNote);
                    Navigator.pop(context);
                  } else {
                    final NoteModel addNote = NoteModel(
                      title: title,
                      note: note,
                    );
                    noteState.addNote(addNote);
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}
