// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_data_snippet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoDataSnippet _$YoutubeVideoDataSnippetFromJson(
    Map<String, dynamic> json) {
  return YoutubeVideoDataSnippet()
    ..publishedAt = json['publishedAt'] as String
    ..channelId = json['channelId'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..thumbnails = json['thumbnails'] == null
        ? null
        : YoutubeVideoThumbnails.fromJson(
            json['thumbnails'] as Map<String, dynamic>)
    ..channelTitle = json['channelTitle'] as String
    ..tags = json['tags'] as List
    ..categoryId = json['categoryId'] as String
    ..liveBroadcastContent = json['liveBroadcastContent'] as String
    ..localized = json['localized'] as Map<String, dynamic>;
}

Map<String, dynamic> _$YoutubeVideoDataSnippetToJson(
        YoutubeVideoDataSnippet instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'tags': instance.tags,
      'categoryId': instance.categoryId,
      'liveBroadcastContent': instance.liveBroadcastContent,
      'localized': instance.localized,
    };
