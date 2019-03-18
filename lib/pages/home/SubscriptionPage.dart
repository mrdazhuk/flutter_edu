import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/domain/youtube/models.dart';
import 'package:flutter_app/pages/channel/ChannelWidget.dart';

class SubscriptionPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubscriptionPageState();
}

class SubscriptionPageState extends State<SubscriptionPageWidget> {
  AppBloc _appBlock;

  @override
  void initState() {
    super.initState();
    _appBlock = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Subscription>>(
        future: _appBlock.subscriptions,
        builder: (context, subscriptionsSnapshot) {
          if (subscriptionsSnapshot.hasData) {
            return ListView.builder(
                itemCount: subscriptionsSnapshot.data.length,
                itemBuilder: (context, index) {
                  var subscription = subscriptionsSnapshot.data[index];
                  return GestureDetector(
                    child: ListTile(
                        title: Text(subscription.channel.title),
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(subscription.channel.thumbnails.defaultUrl))),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => ChannelWidget(
                            subscriptionsSnapshot.data[index].channel.resourceId.channelId),
                      ));
                    },
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
