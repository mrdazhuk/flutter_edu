// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:flutter_app/ModelBlock.dart';
import 'package:flutter_app/ModelProvider.dart';
import 'package:flutter_app/common/localizations.dart';
import 'package:flutter_app/widgets/login/LoginWidget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalBlocsProvider(
        modelBloc: ModelBloc(),
        child: MaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'US'), // English
              const Locale('ua', 'UA'), // Ukrainian
            ],
            onGenerateTitle: (context) =>
            AppLocalizations
                .of(context)
                .title,
            theme: ThemeData.dark(),
            home: LoginWidget()));
  }
}
