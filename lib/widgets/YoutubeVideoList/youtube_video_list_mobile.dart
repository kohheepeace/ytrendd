import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ytrendd/http_client.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/models/youtube_video_data.dart';
import 'package:ytrendd/models/youtube_videos_response.dart';
import 'package:ytrendd/.env.dart';
import 'package:ytrendd/widgets/YoutubeVideoCard/youtube_video_card_mobile.dart';

class YoutubeVideoListMobile extends StatefulWidget {
  final Country country;

  YoutubeVideoListMobile({Key key, this.country}) : super(key: key);

  @override
  _YoutubeVideoListMobileState createState() => _YoutubeVideoListMobileState();
}

class _YoutubeVideoListMobileState extends State<YoutubeVideoListMobile> {
  List<YoutubeVideoData> videos = List<YoutubeVideoData>();
  String nextPageToken = "";

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

  // Todo
  // @override
  // bool get wantKeepAlive {
  //   return false;
  // }

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
    if (videos.length > 0) {
      return CustomScrollView(
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
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
