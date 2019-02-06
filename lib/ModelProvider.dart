import 'package:flutter/widgets.dart';
import 'package:flutter_app/ModelBlock.dart';
import 'package:flutter_app/user/User.dart';

class GlobalBlocsProvider extends InheritedWidget {
  final ModelBloc _modelBloc;
  final UserBloc _userBloc;

  GlobalBlocsProvider({Key key, UserBloc userBloc, ModelBloc modelBloc, Widget child})
      : _userBloc = userBloc,
        _modelBloc = modelBloc,
        super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ModelBloc modelBloc(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(GlobalBlocsProvider) as GlobalBlocsProvider)._modelBloc;

  static UserBloc userBloc(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(GlobalBlocsProvider) as GlobalBlocsProvider)._userBloc;
}
