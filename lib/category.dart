// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatefulWidget {
  final Text text;
  final Color color;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  Category({@required this.text, @required this.color});

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
//  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
//  Widget build(BuildContext context) {
//
//  }

  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }


}

class CategoryState extends State<Category> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Card(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.accessible_forward,
                  size: 60,
                ))
          ]),
        ));
  }
}
