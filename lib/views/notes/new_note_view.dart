import 'package:flutter/material.dart';
import 'package:flutter_application_testingfirebase/services/crud/notes_service.dart';
import '../../services/auth/auth_service.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({super.key});

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  DatabaseNote? _note;
  late final NotesService _notesService;
  late final TextEditingController _textController;

  @override
  void initState() {
    _notesService = NotesService();
    _textController = TextEditingController();
    super.initState();
  }

  Future<DatabaseNote> createNewNote() async {
    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }

    final currentUser = AuthService.firebase().currentUser!;
    final email = currentUser.email!;
    final owner = await _notesService.getUser(email: email);
    return await _notesService.createNote(owner: owner);
  }

  void _deleteNoteIfTextIsEmpty() {
    final note = _note;
    if (_textController.text.isEmpty && note != null) {
      _notesService.deleteNote(id: note.id);
    }
  }

  void _savedIfTextNotEmpty() async {
    final note = _note;
    final text = _textController.text;
    if (note != null && text.isEmpty) {
      await _notesService.updateNote(
        note: note,
        text: text,
      );
    }
  }

  void _textControllerListener() async {
    final note = _note;
    if (note == null) {
      return;
    }
    final text = _textController.text;
    await _notesService.updateNote(
      note: note,
      text: text,
    );
  }

  void _setupTextListenere() {
    _textController.removeListener(_textControllerListener);
    _textController.addListener(_textControllerListener);
  }
  
  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _savedIfTextNotEmpty();
    _textController.dispose();
    super.dispose();
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: FutureBuilder(
        future: createNewNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // case ConnectionState.done:
            case ConnectionState.done:
              _note = snapshot.data as DatabaseNote;
              _setupTextListenere();
              // _setupTextControllerListenere();
              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              );
            //  decoration: const InputDecoration(
            //    hintText: 'Start typing your note here...',
            //);
            default:
              return const CircularProgressIndicator();
          }
        },
      ),

      
      //const Text('write your new note here...'),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: FutureBuilder(
        future: createNewNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _note = snapshot.data; //as DatabaseNote;
              // final dynamic data = snapshot.data;
              print('inside connection done');
              // Get snapshot.data
              //  if (data != null && data is DatabaseNote) {
              //    _note = data as DatabaseNote; // Cast to DatabaseNote
              _setupTextListenere();

              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Start typing your note here...',
                ),
              );
            default:
              return const CircularProgressIndicator();
          }
          //else {
          //  return const Text('Error: Unable to fetch note data.');
          //}
          // break;
          // default:
          //    return const CircularProgressIndicator();
          // }
        },
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_application_testingfirebase/services/crud/notes_service.dart';
import '../../services/auth/auth_service.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  late final NotesService _notesService;
  late Future<DatabaseNote> _noteFuture; // Use a Future for _note

  @override
  void initState() {
    super.initState();
    _notesService = NotesService();
    _noteFuture = createNewNote(); // Initialize the Future here
  }

  Future<DatabaseNote> createNewNote() async {
    final currentUser = AuthService.firebase().currentUser!;
    final email = currentUser.email!;
    final owner = await _notesService.getUser(email: email);
    return await _notesService.createNote(owner: owner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: FutureBuilder(
        future: _noteFuture, // Use the Future here
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final _note = snapshot.data as DatabaseNote; // Access _note here
              final _textController =
                  TextEditingController(); // Create _textController here
              _textController.text = ''; // Set an initial value if needed
              _setupTextListener(_note,
                  _textController); // Pass _note and _textController to _setupTextListener
              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Start typing your note here...',
                ),
              );

            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void _setupTextListener(

      DatabaseNote note, TextEditingController textController,) {
    textController.addListener(() async {
      final text = textController.text;
      await _notesService.updateNote(
        note: note,
        text: text,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

*/
