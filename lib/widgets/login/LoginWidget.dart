import 'package:flutter/material.dart';
import 'package:flutter_app/common/localizations.dart';
import 'package:flutter_app/user/User.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginWidget> {
  final UserBloc _userBloc = UserBloc();

  void login() async {
    _userBloc.getUser().listen(print);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/ic_google.png', scale: 2),
          RaisedButton(
            child: Text(AppLocalizations.of(context).login),
            onPressed: login,
          )
        ],
      ),
    );
  }
}
