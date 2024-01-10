import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  late Locale locale;
  static late Map<String, String> _localizedStrings;
  AppLocalizations({this.locale = AppLocalizationSetup.enLocale});
  /*this will retrieve for us localizations that match the current context*/
/*  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  } */ /*context here means the current locale which is determined automatically */
  Future<void> load() async {
    String jsonString = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate.instance;
  static String? translate(String key) {
    return _localizedStrings[key];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate._internal();
  static final AppLocalizationsDelegate instance =
      AppLocalizationsDelegate._internal();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizationSetup.supportedLocales.contains(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalization = AppLocalizations(locale: locale);
    await appLocalization.load();
    return appLocalization;
  }
}

class AppLocalizationSetup {
  /* app uses two languages english and arabic */
  static const String enLanguage = 'en';
  static const String arLanguage = 'ar';
  static const String enRegion = 'US';
  static const String arRegion = 'EG';
  static const Locale enLocale = Locale(enLanguage, enRegion);
  static const Locale arLocale = Locale(arLanguage, arRegion);
  static List<Locale> localesList = [enLocale, arLocale];
  static String path = 'assets/translations';
  static const Iterable<Locale> supportedLocales = [enLocale, arLocale];

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
