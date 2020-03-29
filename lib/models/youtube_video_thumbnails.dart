import 'package:ytrendd/models/youtube_video_thumbnails_high.dart';
import 'package:ytrendd/models/youtube_video_thumbnails_maxres.dart';
import 'package:ytrendd/models/youtube_video_thumbnails_standard.dart';
import 'package:json_annotation/json_annotation.dart';
part 'youtube_video_thumbnails.g.dart';

@JsonSerializable()
class YoutubeVideoThumbnails {
  YoutubeVideoThumbnailsHigh high;
  YoutubeVideoThumbnailsStandard standard;
  YoutubeVideoThumbnailsMaxres maxres;

  YoutubeVideoThumbnails({this.high, this.standard, this.maxres});

  factory YoutubeVideoThumbnails.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoThumbnailsFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoThumbnailsToJson(this);
}
