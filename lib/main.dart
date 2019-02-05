// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:flutter_app/ModelBlock.dart';
import 'package:flutter_app/ModelProvider.dart';
import 'package:flutter_app/home.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelProvider(
        modelBloc: ModelBloc(),
        child: MaterialApp(title: 'Redux Items', theme: ThemeData.dark(),  home: HomePage()));
  }
}
