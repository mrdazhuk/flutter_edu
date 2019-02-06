import 'package:flutter_app/user/User.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class SSOClient {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'https://www.googleapis.com/auth/youtube.readonly',
      'https://www.googleapis.com/auth/youtube',
    ],
  );

  Observable<User> login() {
    var userSubject = PublishSubject<User>();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      var user = User(account.displayName, account.id);
      userSubject.add(user);
    });

    _googleSignIn.signIn();

    return userSubject;
  }
}
