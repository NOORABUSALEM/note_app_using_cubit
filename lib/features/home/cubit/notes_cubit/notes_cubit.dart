import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:note/sahred/note_service/model/note_model.dart';
import 'package:note/sahred/note_service/repo/note_data_provider.dart';
import 'package:note/sahred/note_service/repo/note_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  late final NoteRepo _repo;

  NotesCubit() : super(NotesInitial()) {
    _repo = NoteRepo(NoteDataProvider());
    fetchNotes();
  }

  void fetchNotes() async {
    emit(NotesLoading());
    final result = await _repo.fetch(50);
    if (result.isNotEmpty) {
      emit(NotesSuccess(result));
      return;
    }
    emit(NotesError("Notes not Found."));
  }

  void deleteNote(NoteModel note) async {
    emit(NotesLoading());
    final result = await _repo.delete(note);
    if (result > 0) {
      final result = await _repo.fetch(50);
      emit(NotesSuccess(result));
      return;
    }
    emit(NotesError("Failed to delete Note."));
  }
}
