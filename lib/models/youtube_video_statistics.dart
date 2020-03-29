import 'package:json_annotation/json_annotation.dart';
part 'youtube_video_statistics.g.dart';

@JsonSerializable()
class YoutubeVideoStatistics {
  YoutubeVideoStatistics();

  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;

  factory YoutubeVideoStatistics.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoStatisticsToJson(this);
}
