part of 'note_cubit.dart';

@immutable
sealed class NoteState extends Equatable {}

final class NoteInitial extends NoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class NoteLoading extends NoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class NoteSuccess extends NoteState {
  final NoteModel note;

  NoteSuccess(this.note);

  @override
  // TODO: implement props
  List<Object?> get props => [note];
}

final class NoteError extends NoteState {
  final String message;

  NoteError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
