import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ytrendd/models/youtube_video_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

class YoutubeVideoCardDesktop extends StatelessWidget {
  final YoutubeVideoData video;
  final int index;
  YoutubeVideoCardDesktop({Key key, this.video, this.index}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(200, 20, 200, 10),
      child: InkWell(
        onTap: _launchURL,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 248 / 138,
              child: Image(
                height: 138,
                image: NetworkImage("${video.snippet.thumbnails.high?.url}"),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${video.snippet.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                        "${video.snippet.channelTitle} • ${formatter.format(int.parse(video.statistics.viewCount))} views • ${timeago.format(DateTime.parse(video.snippet.publishedAt))}",
                        style: Theme.of(context).textTheme.caption),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        '${video.snippet.description}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              padding: EdgeInsets.all(12),
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
            ),
          ],
        ),
      ),
    );
  }
}
