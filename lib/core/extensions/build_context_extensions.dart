import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension NavigationBuildContext on BuildContext {
  Future<T?> gotoNamed<T extends Object?>(
    String name, {
    Object? arguments,
  }) async {
    return await Navigator.of(this).pushNamed(name, arguments: arguments);
  }

  void back<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}

extension LocalesBuildContext on BuildContext {
  AppLocalizations? get l => AppLocalizations.of(this);
}
