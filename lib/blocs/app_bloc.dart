import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/domain/user/login.dart';
import 'package:flutter_app/domain/user/user.dart';

class AppBloc extends BlocBase {
  final Auth _auth = Auth();

  Stream<User> get user => _auth.getLoggedUser();

  @override
  void dispose() {}
}
