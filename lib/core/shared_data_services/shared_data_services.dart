import 'package:note/sahred/note_service/model/note_model.dart';

class SharedDataServices {
  NoteModel _note = NoteModel.empty;

  NoteModel get note => _note;

  set note(NoteModel value) {
    _note = value;
  }
}
