// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/blocs/login_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/pages/home/HomeWidget.dart';
import 'package:flutter_app/pages/login/LoginWidget.dart';
import 'package:flutter_app/pages/profile/ProfileWidget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(App());
}

const ROUTE_ENTRANCE = '/';
const ROUTE_HOME = '/home';
const ROUTE_PROFILE = '/profile';

class App extends StatelessWidget {
  final _routes = {
    ROUTE_ENTRANCE: (context) => LoginWidget(),
    ROUTE_HOME: (context) => HomeWidget(),
    ROUTE_PROFILE: (context) => ProfileWidget()
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
        bloc: AppBloc(),
        child: BlocProvider(
            bloc: LoginBloc(),
            child: MaterialApp(
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en', 'US'),
                  const Locale('ua', 'UA'),
                ],
                onGenerateTitle: (context) =>
                AppLocalizations
                    .of(context)
                    .title,
                theme: ThemeData.light(),
                routes: _routes)));
  }
}
