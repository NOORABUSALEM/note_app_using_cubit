import 'package:flutter/widgets.dart';

extension NavigationBuildContext on BuildContext {
  Future<T?> gotoNamed<T extends Object?>(
    String name, {
    Object? arguments,
  }) async {
    return await Navigator.of(this).pushNamed(name, arguments: arguments);
  }
}
