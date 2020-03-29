// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_videos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideosResponse _$YoutubeVideosResponseFromJson(
    Map<String, dynamic> json) {
  return YoutubeVideosResponse()
    ..kind = json['kind'] as String
    ..etag = json['etag'] as String
    ..nextPageToken = json['nextPageToken'] as String
    ..pageInfo = json['pageInfo'] as Map<String, dynamic>
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : YoutubeVideoData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$YoutubeVideosResponseToJson(
        YoutubeVideosResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'pageInfo': instance.pageInfo,
      'items': instance.items,
    };
