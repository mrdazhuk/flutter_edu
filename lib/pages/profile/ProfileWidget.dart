import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/domain/user/user.dart';
import 'package:flutter_app/widgets/rounded_image.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileWidget> {
  AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _appBloc.user,
      builder: (context, snapshot) =>
          Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations
                  .of(context)
                  .profile),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  RoundedImage(url: snapshot.data.imageUrl, radius: 120),
                  Text(snapshot.data.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(snapshot.data.email,
                      style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue)),
                  RaisedButton(
                    child: Text(AppLocalizations
                        .of(context)
                        .logout),
                    onPressed: _appBloc.logout(),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
