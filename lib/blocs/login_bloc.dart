import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/domain/user/login.dart';
import 'package:flutter_app/domain/user/user.dart';

class LoginBloc extends BlocBase {
  final Auth _auth = Auth();

  Stream<User> get user => _auth.login();

  Stream<User> get lastLogged => _auth.getLoggedUser();

  void _login() {

  }

  @override
  void dispose() {
  }
}
