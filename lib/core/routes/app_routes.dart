import 'package:flutter/widgets.dart';
import 'package:note/features/home/presentation/home_screen.dart';
import 'package:note/features/note/presntation/note_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const home = "note/pad/home";
  static const note = "note/pad/note";
  static final routes = <String, Widget Function(BuildContext)>{
    home: (context) => const HomeScreen(),
    note: (context) => const NoteScreen()
  };
}
