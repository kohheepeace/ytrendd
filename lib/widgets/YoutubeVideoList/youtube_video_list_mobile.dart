import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ytrendd/http_client.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/models/youtube_video_data.dart';
import 'package:ytrendd/models/youtube_videos_response.dart';
import 'package:ytrendd/.env.dart';
import 'package:ytrendd/widgets/YoutubeVideoCard/youtube_video_card_mobile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class YoutubeVideoListMobile extends StatefulWidget {
  final Country country;

  YoutubeVideoListMobile({Key key, this.country}) : super(key: key);

  @override
  _YoutubeVideoListMobileState createState() => _YoutubeVideoListMobileState();
}

class _YoutubeVideoListMobileState extends State<YoutubeVideoListMobile>
    with AutomaticKeepAliveClientMixin {
  bool _keepAlive = true;
  List<YoutubeVideoData> videos = List<YoutubeVideoData>();
  String nextPageToken = "";
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void fetchYoutubeTrendVideos(Country country) async {
    final String regionCode = country.code;
    final int maxResults = 25;

    final String url =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet%2Cstatistics&chart=mostPopular&regionCode=$regionCode&pageToken=$nextPageToken&maxResults=$maxResults&key=$youtubeApiKey';

    try {
      Response response = await dio.get(url);

      final parsedYoutubeResponse =
          YoutubeVideosResponse.fromJson(response.data);

      final newVideos = parsedYoutubeResponse.items;

      setState(() {
        nextPageToken = parsedYoutubeResponse.nextPageToken;
        videos?.addAll(newVideos);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _onRefresh(Country country) async {
    setState(() {
      _keepAlive = false;
    });

    updateKeepAlive();

    fetchYoutubeTrendVideos(country);

    setState(() {
      _keepAlive = true;
    });

    updateKeepAlive();

    _refreshController.refreshCompleted();
  }

  @override
  bool get wantKeepAlive => _keepAlive;

  @override
  void initState() {
    fetchYoutubeTrendVideos(widget.country);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (videos.length > 0) {
      return SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: () => _onRefresh(widget.country),
        header: WaterDropMaterialHeader(),
        child: CustomScrollView(
          key: PageStorageKey<String>(widget.country.code),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < videos.length) {
                    return YoutubeVideoCardMobile(
                        video: videos[index], index: index);
                  } else {
                    fetchYoutubeTrendVideos(widget.country);
                    return null;
                  }
                },
                childCount: videos.length + 1,
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
