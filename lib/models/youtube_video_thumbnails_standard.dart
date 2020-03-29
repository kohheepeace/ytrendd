import 'package:json_annotation/json_annotation.dart';
part 'youtube_video_thumbnails_standard.g.dart';

@JsonSerializable()
class YoutubeVideoThumbnailsStandard {
  int height;
  int width;
  String url;

  YoutubeVideoThumbnailsStandard({this.height, this.width, this.url});

  factory YoutubeVideoThumbnailsStandard.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoThumbnailsStandardFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoThumbnailsStandardToJson(this);
}
