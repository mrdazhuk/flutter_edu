class Subscription {
  final Channel channel;
  final ContentDetails contentDetails;

  Subscription({this.channel, this.contentDetails});
}

class ContentDetails {
  final int totalItemCount;
  final int newItemCount;
  final String activityType;

  ContentDetails({this.totalItemCount, this.newItemCount, this.activityType});
}

class Channel {
  final DateTime publishedAt;
  final String title;
  final String description;
  final ResourceId resourceId;
  final String channelId;
  final Thumbnails thumbnails;

  Channel(
      {this.publishedAt,
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
