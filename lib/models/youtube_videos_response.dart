import 'package:ytrendd/models/youtube_video_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'youtube_videos_response.g.dart';

@JsonSerializable()
class YoutubeVideosResponse {
  YoutubeVideosResponse();

  String kind;
  String etag;
  String nextPageToken;
  Map<String, dynamic> pageInfo;
  List<YoutubeVideoData> items;

  factory YoutubeVideosResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideosResponseToJson(this);
}
