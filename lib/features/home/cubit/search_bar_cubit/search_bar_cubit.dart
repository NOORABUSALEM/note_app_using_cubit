import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarInitial());
}
