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

  Future<List<Subscription>> get subscriptions =>
      _api.getSubscriptions().reduce((previous, subscription) {
        return List.from(previous)
          ..addAll(subscription);
      });

  Future<Channel> getChannelById(String id) => _api.getChannel(id);

  logout() => _auth.logout();

  @override
  void dispose() {}
}
