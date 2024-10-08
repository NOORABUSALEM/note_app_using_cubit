part of 'alert_note_cubit.dart';

@immutable
sealed class AlertNoteState {}

final class AlertNoteInitial extends AlertNoteState {}

final class AlertNoteLoading extends AlertNoteState {}

final class AlertNoteSuccess extends AlertNoteState {
  final String message;

  AlertNoteSuccess(this.message);
}

final class AlertNoteError extends AlertNoteState {
  final String message;

  AlertNoteError(this.message);
}
