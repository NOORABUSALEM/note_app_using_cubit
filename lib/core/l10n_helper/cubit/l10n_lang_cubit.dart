import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'l10n_lang_state.dart';

class L10nLangCubit extends Cubit<L10nLangState> {
  L10nLangCubit() : super(L10nLangEn());

  void switchToArabic() {
    emit(L10nLangAr());
  }

  void switchToEnglish() {
    emit(L10nLangEn());
  }
}
