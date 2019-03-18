import 'package:flutter_app/domain/youtube/models.dart';

class ChannelMapper {
  static Channel map(Map<String, dynamic> data) {
    final channelData = data['snippet'];
    final thumbnailsData = channelData['thumbnails'];
    final statisticsData = data['statistics'];
    return Channel(
        id: channelData["id"],
        title: channelData["title"],
        thumbnails: Thumbnails(
            defaultUrl: thumbnailsData['default']['url'],
            highUrl: thumbnailsData['high']['url'],
            mediumUrl: thumbnailsData['medium']['url']),
        description: channelData["description"],
        statistics: Statistics(
            commentCount: int.parse(statisticsData['commentCount']),
            subscriberCount: int.parse(statisticsData['subscriberCount']),
            videoCount: int.parse(statisticsData['videoCount']),
            viewCount: int.parse(statisticsData['viewCount'])));
  }
}

class SubscriptionMapper {
  static Subscription map(Map<String, dynamic> data) {
    var contentDetailsData = data['contentDetails'];
    var channelData = data['snippet'];
    var thumbnailsData = channelData['thumbnails'];
    var resourceIdData = channelData['resourceId'];

    return Subscription(
        contentDetails: ContentDetails(
            activityType: contentDetailsData['activityType'],
            newItemCount: contentDetailsData['newItemCount'],
            totalItemCount: contentDetailsData['totalItemCount']),
        channel: SubscriptionChannel(
            title: channelData['title'],
            channelId: channelData['channelId'],
            description: channelData['description'],
            publishedAt: DateTime.parse(channelData['publishedAt']),
            resourceId: ResourceId(channelId: resourceIdData['channelId']),
            thumbnails: Thumbnails(
                defaultUrl: thumbnailsData['default']['url'],
                highUrl: thumbnailsData['high']['url'],
                mediumUrl: thumbnailsData['medium']['url'])));
  }
}
