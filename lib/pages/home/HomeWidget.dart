import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widgets/rounded_image.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeWidget> {
  AppBloc _appBlock;

  @override
  void initState() {
    super.initState();
    _appBlock = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _appBlock.user,
        builder: (context, userSnapshot) => Scaffold(
              appBar: AppBar(title: Text(userSnapshot.data.name), actions: <Widget>[
                IconButton(
                  icon: RoundedImage(url: userSnapshot.data.imageUrl, radius: 30),
                  onPressed: () => Navigator.of(context).pushNamed(ROUTE_PROFILE),
                )
              ]),
              body: Text("asasd"),
            ));
  }
}
