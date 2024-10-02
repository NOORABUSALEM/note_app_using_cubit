import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarHide()) {
    searchController = TextEditingController();
  }

  late final TextEditingController searchController;

  void show() {
    emit(SearchBarShow());
  }

  void hide() {
    emit(SearchBarHide());
  }
}
