import 'package:json_annotation/json_annotation.dart';
part 'youtube_video_thumbnails_maxres.g.dart';

@JsonSerializable()
class YoutubeVideoThumbnailsMaxres {
  int height;
  int width;
  String url;

  YoutubeVideoThumbnailsMaxres({this.height, this.width, this.url});

  factory YoutubeVideoThumbnailsMaxres.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoThumbnailsMaxresFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoThumbnailsMaxresToJson(this);
}
