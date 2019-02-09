import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/domain/api/api.dart';
import 'package:flutter_app/domain/user/login.dart';
import 'package:flutter_app/domain/user/user.dart';
import 'package:flutter_app/domain/youtube/models.dart';

class AppBloc extends BlocBase {
  final Auth _auth = Auth();
  Api _api;

  AppBloc() {
    _api = Api(TokenProvider(_auth.getLoggedUser()));
  }

  Stream<User> get user => _auth.getLoggedUser();

  Stream<List<Subscription>> get subscriptions => _api.getSubscriptions();

  @override
  void dispose() {}

  logout() {}
}
