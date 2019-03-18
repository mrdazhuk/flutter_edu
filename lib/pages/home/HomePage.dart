import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/widgets/rounded_image.dart';

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  AppBloc _appBlock;

  @override
  void initState() {
    super.initState();
    _appBlock = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
