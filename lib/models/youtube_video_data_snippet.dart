import 'package:ytrendd/models/youtube_video_thumbnails.dart';
import 'package:json_annotation/json_annotation.dart';

part 'youtube_video_data_snippet.g.dart';

@JsonSerializable()
class YoutubeVideoDataSnippet {
  YoutubeVideoDataSnippet();

  String publishedAt;
  String channelId;
  String title;
  String description;
  YoutubeVideoThumbnails thumbnails;
  String channelTitle;
  List tags;
  String categoryId;
  String liveBroadcastContent;
  Map<String, dynamic> localized;

  factory YoutubeVideoDataSnippet.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoDataSnippetFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoDataSnippetToJson(this);
}
