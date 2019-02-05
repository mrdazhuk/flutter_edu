import 'package:flutter/widgets.dart';
import 'package:flutter_app/ModelBlock.dart';

class ModelProvider extends InheritedWidget {
  final ModelBloc modelBloc;

  ModelProvider({Key key, ModelBloc modelBloc, Widget child})
      : this.modelBloc = modelBloc,
        super(child: child, key: key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ModelBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ModelProvider) as ModelProvider).modelBloc;
}
