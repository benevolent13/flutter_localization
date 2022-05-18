import 'package:flutter/material.dart';
import 'package:flutter_localization/language/app_translation.dart';

class AppTranslationDelegate extends LocalizationsDelegate<AppTranslations>{
  final Locale newLocale;

  AppTranslationDelegate({required this.newLocale});

  @override
  bool isSupported(Locale locale) {
    Locale mLocale = newLocale ?? locale;
//    print("Locale : " + mLocale.languageCode);
    final List<String> supportedLanguagesCodes = [
      "en",
      "hi",
    ];
    bool isSupport = supportedLanguagesCodes.contains(mLocale.languageCode);
//    print("Locale Support: " + isSupport.toString());
    return isSupport;
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}