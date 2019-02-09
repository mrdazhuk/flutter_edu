import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/login_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/main.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginWidget> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.lastLogged.listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).login)),
        body: Center(
            child: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/ic_google.png', scale: 2),
            RaisedButton(
                child: Text(AppLocalizations.of(context).loginWithGoogle),
                onPressed: () => {} //_loginBloc.login.add(null),
                )
          ],
        ))));
  }
}
