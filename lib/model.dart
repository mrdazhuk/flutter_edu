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

//  static const String _youtube = 'https://www.googleapis.com/youtube/v3/activities?part=snippet&mine=true&key=AIzaSyD9MJkuKrMvx3aBtJroxxCz4R8E81K9Xis';
  static const String _youtube =
      'https://www.googleapis.com/youtube/v3/activities?part=snippet,contentDetails&channelId=UCRdl5_f9hOFBRrObDwC9Uuw&key=AIzaSyD9MJkuKrMvx3aBtJroxxCz4R8E81K9Xis&maxResults=50';

  Observable<List<Model>> get() {
    return Observable.fromFuture(_client.get(_url))
        .map((data) => data.body)
        .map(json.decode)
        .map((jsonObjects) => jsonObjects.map<Model>((object) => Model.fromJson(object)).toList());
  }

  Observable<String> getActivtiy() {
    return Observable.fromFuture(_client.get(_youtube, headers: {
      "X-Android-Package": "com.ydazhuk.flutterapp",
      "X-Android-Cert": "7a267a5d9946f51416f287861481cd2e6c680310"
    }
//        , headers: {"X-Ios-Bundle-Identifier": "com.ydazhuk.flutterApp"}
    )).map((data) => data.body);
//        .map(json.decode)
//        .map((jsonObjects) => jsonObjects.map<Model>((object) => Model.fromJson(object)).toList());
  }
}
