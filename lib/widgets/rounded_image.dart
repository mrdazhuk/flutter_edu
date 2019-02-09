import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double _radius;
  final String _url;

  RoundedImage({@required double radius, @required String url})
      : this._radius = radius,
        this._url = url;

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: _radius,
        height: _radius,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(fit: BoxFit.fill, image: new NetworkImage(_url))));
  }
}
