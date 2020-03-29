import 'package:json_annotation/json_annotation.dart';
part 'youtube_video_thumbnails_high.g.dart';

@JsonSerializable()
class YoutubeVideoThumbnailsHigh {
  int height;
  int width;
  String url;

  YoutubeVideoThumbnailsHigh({this.height, this.width, this.url});

  factory YoutubeVideoThumbnailsHigh.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoThumbnailsHighFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoThumbnailsHighToJson(this);
}
