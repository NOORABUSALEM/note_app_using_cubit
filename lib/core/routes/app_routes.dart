import 'package:flutter/widgets.dart';
import 'package:note/features/home/presentation/home_screen.dart';
import 'package:note/features/note/presntation/note_screen.dart';

class AppRoutes {
  AppRoutes._(this.context);

  AppRoutes.of(this.context);

  final BuildContext context;
  static const home = "note/pad/home";
  static const note = "note/pad/note";
  static final routes = <String, Widget Function(BuildContext)>{
    home: (context) {
      return const HomeScreen();
    },
    note: (context) {
      return const NoteScreen();
    }
  };

  Future<T?> toNamed<T extends Object?>(
    String name, {
    Object? arguments,
  }) async {
    return await Navigator.of(context).pushNamed(
      name,
      arguments: arguments,
    );
  }
}
