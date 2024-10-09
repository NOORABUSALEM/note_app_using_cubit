import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:note/core/shared_data_services/shared_data_services.dart';
import 'package:note/sahred/note_service/model/note_model.dart';
import 'package:note/sahred/note_service/repo/note_data_provider.dart';
import 'package:note/sahred/note_service/repo/note_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  late final NoteRepo _repo;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  NoteModel editNote = NoteModel.empty;

  NoteCubit() : super(NoteInitial()) {
    _repo = NoteRepo(NoteDataProvider());
    editNote = GetIt.I<SharedDataServices>().note;
    titleController.text = editNote.title ?? "";
    descriptionController.text = editNote.description ?? "";
  }

  bool get isEditNote {
    return editNote.id != null;
  }

  NoteModel get noteForm => NoteModel(
        id: editNote.id,
        title: titleController.text,
        description: descriptionController.text,
        colorCode: 0xFFFDAF58,
      );

  void onSaveButtonSubmitted() async {
    if (isEditNote) {
      updateNote(noteForm);
      return;
    }
    createNote(noteForm);
  }

  void createNote(NoteModel note) async {
    if (state is NoteLoading) return;
    emit(NoteLoading());
    final result = await _repo.create(note);
    if (result > 0) {
      emit(NoteSuccess(note));
      return;
    }
    emit(NoteError("Failed to create note."));
  }

  void updateNote(NoteModel note) async {
    if (state is NoteLoading) return;
    emit(NoteLoading());
    final result = await _repo.update(note);
    if (result > 0) {
      emit(NoteSuccess(note));
      return;
    }
    emit(NoteError("Failed to update note."));
  }
}
