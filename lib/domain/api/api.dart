import 'dart:convert';

import 'package:flutter_app/domain/youtube/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class Api {
  final String baseUrl = "https://www.googleapis.com/youtube/v3/";
  final http.Client _client = http.Client();
  final TokenProvider tokenProvider;

  Api(this.tokenProvider);

  Stream<List<Subscription>> getSubscriptions() async* {
    ApiResponse<List<Subscription>> apiResponse;
    do {
      final pageParams = apiResponse != null && apiResponse.nextPageToken != null
          ? "&pageToken=" + apiResponse.nextPageToken
          : "";

      apiResponse =
          await _doGet("subscriptions?part=snippet%2CcontentDetails&mine=true" + pageParams)
              .then((response) => ApiResponse<List<Subscription>>(
                  nextPageToken: response['nextPageToken'],
                  data: response['items'].map<Subscription>((data) {
                    var contentDetailsData = data['contentDetails'];
                    var channelData = data['snippet'];
                    var thumbnailsData = channelData['thumbnails'];
                    var resourceIdData = channelData['resourceId'];

                    return Subscription(
                        contentDetails: ContentDetails(
                            activityType: contentDetailsData['activityType'],
                            newItemCount: contentDetailsData['newItemCount'],
                            totalItemCount: contentDetailsData['totalItemCount']),
                        channel: Channel(
                            title: channelData['title'],
                            channelId: channelData['channelId'],
                            description: channelData['description'],
                            publishedAt: DateTime.parse(channelData['publishedAt']),
                            resourceId: ResourceId(channelId: resourceIdData['channelId']),
                            thumbnails: Thumbnails(
                                defaultUrl: thumbnailsData['default']['url'],
                                highUrl: thumbnailsData['high']['url'],
                                mediumUrl: thumbnailsData['medium']['url'])));
                  }).toList()));
      yield apiResponse.data;
    } while (apiResponse.nextPageToken != null && apiResponse.nextPageToken.isNotEmpty);
  }

  Future<Map<String, dynamic>> _doGet(String urlPath) => _client
      .get(baseUrl + urlPath, headers: _getAuthHeader())
      .then((resp) => json.decode(resp.body));

  _getAuthHeader() => {"Authorization": "Bearer " + tokenProvider.getToken()};
}

class ApiResponse<T> {
  final String nextPageToken;
  final T data;

  ApiResponse({@required this.nextPageToken, @required this.data});
}

class TokenProvider {
  String token;

  TokenProvider(Observable user) {
    user.listen((newToken) => this.token = newToken.oAuth.token);
  }

  String getToken() => token;
}
