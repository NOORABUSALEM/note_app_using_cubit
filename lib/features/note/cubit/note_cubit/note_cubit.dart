import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:note/sahred/note_service/model/note_model.dart';
import 'package:note/sahred/note_service/repo/note_data_provider.dart';
import 'package:note/sahred/note_service/repo/note_repo.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  late final NoteRepo _repo;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  NoteCubit() : super(NoteInitial()) {
    _repo = NoteRepo(NoteDataProvider());
  }

  NoteModel get noteForm => NoteModel(
        title: titleController.text,
        description: descriptionController.text,
        colorCode: 0xFFFDAF58,
      );

  void createNote() async {
    if (state is NoteLoading) return;
    emit(NoteLoading());
    final note = noteForm;
    final result = await _repo.create(note);
    if (result > 0) {
      emit(NoteSuccess(note));
      return;
    }
    emit(NoteError("Failed to create note."));
  }
}
