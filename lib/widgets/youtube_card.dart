import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ytrendd/models/youtube_video_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

class YoutubeCard extends StatelessWidget {
  final YoutubeVideoData video;
  final int index;
  YoutubeCard({Key key, this.video, this.index}) : super(key: key);

  void _launchURL() async {
    final url = 'https://www.youtube.com/watch?v=${video.id}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: 'en');

    return InkWell(
      onTap: _launchURL,
      child: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                image: NetworkImage("${video.snippet.thumbnails.high?.url}"),
                fit: BoxFit.cover, // use this
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 8.0, 10.0),
            dense: true,
            leading: Container(
              child: Text(
                "${index + 1}",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 0.8,
                    offset: Offset(
                      4.0,
                      8.0,
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(12),
            ),
            title: Text("${video.snippet.title}"),
            subtitle: Text(
                "${video.snippet.channelTitle} • ${formatter.format(int.parse(video.statistics.viewCount))} views • ${timeago.format(DateTime.parse(video.snippet.publishedAt))}"),
          ),
        ],
      ),
    );
  }
}
