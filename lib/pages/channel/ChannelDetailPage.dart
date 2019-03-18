import 'package:flutter/material.dart';
import 'package:flutter_app/domain/youtube/models.dart';

class ChannelDetailPage extends StatelessWidget {
  final Channel channel;

  const ChannelDetailPage(this.channel) : super();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[_buildAboutSection(), _buildVideosSection()],
    );
  }

  Widget _buildAboutSection() {
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
            ),
            SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.network(
                  channel.thumbnails.highUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: FractionalOffset(0.1, 0.5),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(channel.thumbnails.mediumUrl),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(channel.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text(
                    channel.statistics.subscriberCount.toString(),
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildVideosSection() {
    return Text("adsad");
  }
}
