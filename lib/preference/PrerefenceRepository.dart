import 'package:flutter_app/user/User.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const _USER_ID = "ID";
  static const _USER_NAME = "NAME";

  var _preference = Observable.fromFuture(SharedPreferences.getInstance());

  Observable<void> saveUser(User user) {
    return _preference.flatMap((pref) => Observable.concat(List.unmodifiable(
        [pref.setString(_USER_ID, user.id), pref.setString(_USER_NAME, user.name)])));
  }

  Observable<User> getUser() {
    return _preference.map((pref) => User(pref.getString(_USER_ID), pref.getString(_USER_NAME)));
  }
}
