import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarHide());

  void show() {
    emit(SearchBarShow());
  }

  void hide() {
    emit(SearchBarHide());
  }
}
