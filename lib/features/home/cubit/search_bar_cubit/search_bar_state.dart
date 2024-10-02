part of 'search_bar_cubit.dart';

@immutable
sealed class SearchBarState {}

final class SearchBarShow extends SearchBarState {}
final class SearchBarHide extends SearchBarState {}
