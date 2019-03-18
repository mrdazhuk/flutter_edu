import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/blocs/app_bloc.dart';
import 'package:flutter_app/common/localization/localizations.dart';
import 'package:flutter_app/domain/youtube/models.dart';
import 'package:flutter_app/pages/channel/ChannelDetailPage.dart';

class ChannelWidget extends StatefulWidget {
  final String channelId;

  ChannelWidget(this.channelId);

  @override
  State<StatefulWidget> createState() => _ChannelState();
}

class _ChannelState extends State<ChannelWidget> {
  AppBloc _appBlock;

  @override
  void initState() {
    super.initState();
    _appBlock = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _appBlock.getChannelById(widget.channelId),
        builder: (BuildContext context, AsyncSnapshot<Channel> channelSnapshot) {
          if (channelSnapshot.hasData) {
            final channel = channelSnapshot.data;
            return DefaultTabController(
                length: tabs.length,
                child: Scaffold(
                  appBar: AppBar(
                      title: Text(channel.title),
                      bottom: TabBar(
                          isScrollable: true,
                          tabs: tabs.map((tabInfo) => Tab(text: tabInfo.title(context))).toList())),
                  body: TabBarView(
                      children: tabs.map((tabInfo) => tabInfo.factory(channel)).toList()),
                ));
          } else {
            return Container();
          }
        });
  }
}

class TabInfo {
  final String Function(BuildContext) title;
  final Widget Function(Channel) factory;

  TabInfo(this.title, this.factory);
}

List<TabInfo> tabs = <TabInfo>[
  TabInfo((context) => AppLocalizations.of(context).tabChannelMain,
      (apiChannel) => ChannelDetailPage(apiChannel)),
  TabInfo((context) => AppLocalizations.of(context).tabChannelVideos, (apiChannel) => Container()),
  TabInfo((context) => AppLocalizations.of(context).tabChannelAbout, (apiChannel) => Container())
];
