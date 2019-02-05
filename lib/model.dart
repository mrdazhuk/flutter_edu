import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class Model {
  final String name;
  final String url;

  Model(this.name, this.url);

  Model.fromJson(Map json) : this(json["title"], json["link"]);
}

class RemoteRepository {
  final http.Client _client = http.Client();

  static const String _url = 'http://www.mocky.io/v2/5c599df83200009f1eba39e9';

  Observable<List<Model>> get() {
    return Observable.fromFuture(_client.get(_url))
        .map((data) => data.body)
        .map(json.decode)
        .map((jsonObjects) => jsonObjects.map<Model>((object) => Model.fromJson(object)).toList());
  }
}
