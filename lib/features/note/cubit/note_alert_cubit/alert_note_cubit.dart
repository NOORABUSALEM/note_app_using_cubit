import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'alert_note_state.dart';

class AlertNoteCubit extends Cubit<AlertNoteState> {
  AlertNoteCubit() : super(AlertNoteInitial());

  void success(String message) {
    emit(AlertNoteSuccess(message));
  }

  void error(String message) {
    emit(AlertNoteError(message));
  }

  void loading() {
    emit(AlertNoteLoading());
  }

  void init() {
    emit(AlertNoteInitial());
  }
}
