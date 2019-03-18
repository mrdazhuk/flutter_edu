import 'package:dio/dio.dart';
import 'package:flutter_app/domain/api/mappers.dart';
import 'package:flutter_app/domain/youtube/models.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:alice/alice.dart';

//Alice alice = Alice(showNotification: true);

class Api {
  final String baseUrl = "https://www.googleapis.com/youtube/v3/";
  final Dio _dio;
  final TokenProvider tokenProvider;

  Api(this.tokenProvider) : _dio = Dio() {
    _dio.interceptors
//      ..add(alice.getDioInterceptor())
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        options.headers["Authorization"] = "Bearer " + tokenProvider.token;
      }));
  }

  Future<Channel> getChannel(String id) {
    final requestMaker =
        () => _dio.get(baseUrl + "channels?part=snippet%2CcontentDetails%2Cstatistics&id=$id");
    return _makeRequest(requestMaker, ChannelMapper.map);
  }

  Stream<List<Subscription>> getSubscriptions() {
    final requestMaker = (String pageParams) =>
        _dio.get(baseUrl + 'subscriptions?part=snippet%2CcontentDetails&mine=true' + pageParams);
    return _makePagedRequest(requestMaker, SubscriptionMapper.map);
  }

  Future<T> _makeRequest<T>(Future<Response<dynamic>> requestMaker(),
      T mapper(Map<String, dynamic> params)) async =>
      requestMaker().then((response) =>
      response.data["items"]
          .map((data) => mapper(data))
          .toList()[0]);

  Stream<List<T>> _makePagedRequest<T>(Future<Response<dynamic>> requestMaker(String pageParams),
      T mapper(Map<String, dynamic> params)) async* {
    String nextPageToken;
    List<T> mappedResponse;
    do {
      final pageParams = nextPageToken != null ? "&pageToken=" + nextPageToken : "";

      await requestMaker(pageParams).then((response) {
        nextPageToken = response.data['nextPageToken'];
        mappedResponse = response.data["items"].map<T>((data) => mapper(data)).toList();
      });
      yield mappedResponse;
    } while (nextPageToken != null && nextPageToken.isNotEmpty);
  }
}

class TokenProvider {
  String token;

  TokenProvider(Observable user) {
    user.listen((newToken) => this.token = newToken.oAuth.token);
  }

  String getToken() => token;
}
