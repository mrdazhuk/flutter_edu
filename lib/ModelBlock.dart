import 'package:flutter_app/model.dart';
import 'package:rxdart/rxdart.dart';

class ModelBloc {
  final RemoteRepository _repository = RemoteRepository();

  Observable<List<Model>> models() {
    return _repository.get();
  }
}