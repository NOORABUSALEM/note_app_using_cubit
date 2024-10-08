part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {
  bool get readonly => throw UnimplementedError();
}

final class EditNoteEdit extends EditNoteState {
  @override
  bool get readonly => false;
}

final class EditNoteWatch extends EditNoteState {
  @override
  bool get readonly => true;
}
