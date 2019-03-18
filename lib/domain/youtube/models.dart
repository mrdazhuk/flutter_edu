class Channel {
  final String id;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final Statistics statistics;

  Channel({this.id, this.title, this.description, this.thumbnails, this.statistics});
}

class Statistics {
  final int viewCount;
  final int commentCount;
  final int subscriberCount;
  final int videoCount;

  Statistics({this.viewCount, this.commentCount, this.subscriberCount, this.videoCount});
}

class Subscription {
  final SubscriptionChannel channel;
  final ContentDetails contentDetails;

  Subscription({this.channel, this.contentDetails});
}

class ContentDetails {
  final int totalItemCount;
  final int newItemCount;
  final String activityType;

  ContentDetails({this.totalItemCount, this.newItemCount, this.activityType});
}

class SubscriptionChannel {
  final DateTime publishedAt;
  final String title;
  final String description;
  final ResourceId resourceId;
  final String channelId;
  final Thumbnails thumbnails;

  SubscriptionChannel({this.publishedAt,
    this.title,
    this.description,
    this.resourceId,
    this.channelId,
    this.thumbnails});
}

class Thumbnails {
  final String defaultUrl;
  final String highUrl;
  final String mediumUrl;

  Thumbnails({this.defaultUrl, this.highUrl, this.mediumUrl});
}

class ResourceId {
  final String channelId;

  ResourceId({this.channelId});
}
