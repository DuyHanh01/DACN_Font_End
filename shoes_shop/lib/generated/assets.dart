import 'dart:ui';

import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';

class LocaleProvider extends BaseViewModel {
  Locale _locale = const Locale.fromSubtags(languageCode: 'en');
  Locale get locale => _locale;

  void setLocale(Locale locale) async {
    if(!S.delegate.supportedLocales.contains(locale)) return;
    _locale = locale;
    setState(ViewState.Idle);
  }
}