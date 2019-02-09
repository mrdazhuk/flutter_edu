import 'package:flutter_app/domain/user/login.dart';
import 'package:rxdart/rxdart.dart';

class User {
  final String name;
  final String id;
  final String imageUrl;
  final String email;
  final OAuth oAuth;

  User(this.id, this.name, this.email, this.imageUrl, this.oAuth);
}

class OAuth {
  final String token;

  OAuth(this.token);
}

class UserBloc {
  final Auth _auth = Auth();

  UserBloc() {}

  Observable<User> getUser() => _auth.login();
}
