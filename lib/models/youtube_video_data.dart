import 'package:ytrendd/models/youtube_video_data_snippet.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ytrendd/models/youtube_video_statistics.dart';
part 'youtube_video_data.g.dart';

@JsonSerializable()
class YoutubeVideoData {
  YoutubeVideoData();

  String kind;
  String etag;
  String id;
  YoutubeVideoDataSnippet snippet;
  YoutubeVideoStatistics statistics;

  factory YoutubeVideoData.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoDataFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoDataToJson(this);
}
