// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoData _$YoutubeVideoDataFromJson(Map<String, dynamic> json) {
  return YoutubeVideoData()
    ..kind = json['kind'] as String
    ..etag = json['etag'] as String
    ..id = json['id'] as String
    ..snippet = json['snippet'] == null
        ? null
        : YoutubeVideoDataSnippet.fromJson(
            json['snippet'] as Map<String, dynamic>)
    ..statistics = json['statistics'] == null
        ? null
        : YoutubeVideoStatistics.fromJson(
            json['statistics'] as Map<String, dynamic>);
}

Map<String, dynamic> _$YoutubeVideoDataToJson(YoutubeVideoData instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
      'statistics': instance.statistics,
    };
