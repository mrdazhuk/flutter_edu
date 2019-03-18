import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/domain/user/user.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pages/home/HomePage.dart';
import 'package:flutter_app/pages/home/SubscriptionPage.dart';
import 'package:flutter_app/widgets/rounded_image.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeWidget> {
  AppBloc _appBlock;
  List<Widget> _pages = [SubscriptionPageWidget(), HomePageWidget()];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _appBlock = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(ROUTE_SEARCH);
            }),
        StreamBuilder<User>(
            stream: _appBlock.user,
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                return IconButton(
                  icon: RoundedImage(url: userSnapshot.data.imageUrl, radius: 30),
                  onPressed: () => Navigator.of(context).pushNamed(ROUTE_PROFILE),
                );
              } else {
                return Container(
                  child: Text("as"),
                );
              }
            })
      ]),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(AppLocalizations
              .of(context)
              .tabHome)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              title: Text(AppLocalizations
                  .of(context)
                  .tabSubscriptions))
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
