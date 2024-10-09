import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:note/core/l10n_helper/cubit/l10n_lang_cubit.dart';
import 'package:note/core/routes/app_routes.dart';
import 'package:note/core/shared_data_services/shared_data_services.dart';
import 'package:note/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => SharedDataServices());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => L10nLangCubit(),
        ),
      ],
      child: const MainMaterialApp(),
    );
  }
}

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<L10nLangCubit, L10nLangState>(
      builder: (context, state) {
        final local = switch (state) {
          L10nLangEn() => AppLocalizations.supportedLocales.firstWhere(
              (l) => l.languageCode.toLowerCase().contains("en") == true,
            ),
          L10nLangAr() => AppLocalizations.supportedLocales.firstWhere(
              (l) => l.languageCode.toLowerCase().contains("ar") == true,
            ),
        };
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: local,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(context),
          initialRoute: AppRoutes.home,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
