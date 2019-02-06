import 'package:flutter_app/preference/PrerefenceRepository.dart';
import 'package:flutter_app/user/SSOClient.dart';
import 'package:rxdart/rxdart.dart';

class User {
  final String name;
  final String id;

  User(this.id, this.name);
}

class UserBloc {
  final PreferenceRepository _preferenceRepository = PreferenceRepository();
  final SSOClient _ssoClient = SSOClient();

  UserBloc() {}

  Observable<User> getUser() {
    return _preferenceRepository.getUser();
  }

  Observable<User> ssoLogin() {
    return _ssoClient
        .login()
        .flatMap((user) => _preferenceRepository.saveUser(user).map((any) => user));
  }
}
