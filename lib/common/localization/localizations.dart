import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/localization/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Youtubchik', name: 'title', desc: 'The application title');
  }

  String get login {
    return Intl.message('Login', name: 'login');
  }

  String get loginWithGoogle {
    return Intl.message('Login with Google', name: 'loginWithGoogle');
  }

  String get profile {
    return Intl.message('Profile', name: 'profile');
  }

  String get logout {
    return Intl.message('Logout', name: 'logout');
  }

  String get tabHome {
    return Intl.message('Home', name: 'tabHome');
  }

  String get tabSubscriptions {
    return Intl.message('Subscribtions', name: 'tabSubscriptions');
  }

  String get tabChannelMain {
    return Intl.message('Main', name: 'tabChannelMain');
  }

  String get tabChannelVideos {
    return Intl.message('Video', name: 'tabChannelVideos');
  }

  String get tabChannelAbout {
    return Intl.message('About channel', name: 'tabChannelAbout');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ua'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
