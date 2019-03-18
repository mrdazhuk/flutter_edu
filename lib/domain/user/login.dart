import 'dart:async';

import 'package:flutter_app/domain/user/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class Auth {
  Completer<User> _completer = new Completer();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'https://www.googleapis.com/auth/youtube.readonly',
      'https://www.googleapis.com/auth/youtube',
      'https://www.googleapis.com/auth/youtube.upload'
    ],
  );

  Observable<User> login() => Observable.fromFuture(_login());

  Observable<User> getLoggedUser() => Observable.fromFuture(_googleSignIn.signInSilently()).flatMap(
      (loggedUser) => loggedUser != null ? _getUser(loggedUser).asStream() : Observable.empty());

  Observable<void> logout() => Observable.fromFuture(_googleSignIn.signOut());

  Future<User> _login() async {
    _googleSignIn.onCurrentUserChanged.map(_getUser).listen(_completer.complete);
    _googleSignIn.signIn();
    return _completer.future;
  }

  Future<User> _getUser(GoogleSignInAccount singInAccount) async =>
      singInAccount.authentication.then((singInAuthentication) {
        final oauth = OAuth(singInAuthentication.accessToken);

        return User(singInAccount.id, singInAccount.displayName, singInAccount.email,
            singInAccount.photoUrl, oauth);
      });
}
