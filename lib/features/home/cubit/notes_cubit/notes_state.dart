part of 'notes_cubit.dart';

@immutable
sealed class NotesState extends Equatable {}

final class NotesInitial extends NotesState {
  @override
  List<Object?> get props => [];
}

final class NotesLoading extends NotesState {
  @override
  List<Object?> get props => [];
}

final class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);

  @override
  List<Object?> get props => [notes];
}

final class NotesError extends NotesState {
  final String message;

  NotesError(this.message);

  @override
  List<Object?> get props => [];
}
