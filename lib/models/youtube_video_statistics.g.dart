// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoStatistics _$YoutubeVideoStatisticsFromJson(
    Map<String, dynamic> json) {
  return YoutubeVideoStatistics()
    ..viewCount = json['viewCount'] as String
    ..likeCount = json['likeCount'] as String
    ..dislikeCount = json['dislikeCount'] as String
    ..favoriteCount = json['favoriteCount'] as String
    ..commentCount = json['commentCount'] as String;
}

Map<String, dynamic> _$YoutubeVideoStatisticsToJson(
        YoutubeVideoStatistics instance) =>
    <String, dynamic>{
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'favoriteCount': instance.favoriteCount,
      'commentCount': instance.commentCount,
    };
