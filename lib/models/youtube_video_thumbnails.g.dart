// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_thumbnails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoThumbnails _$YoutubeVideoThumbnailsFromJson(
    Map<String, dynamic> json) {
  return YoutubeVideoThumbnails(
    high: json['high'] == null
        ? null
        : YoutubeVideoThumbnailsHigh.fromJson(
            json['high'] as Map<String, dynamic>),
    standard: json['standard'] == null
        ? null
        : YoutubeVideoThumbnailsStandard.fromJson(
            json['standard'] as Map<String, dynamic>),
    maxres: json['maxres'] == null
        ? null
        : YoutubeVideoThumbnailsMaxres.fromJson(
            json['maxres'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$YoutubeVideoThumbnailsToJson(
        YoutubeVideoThumbnails instance) =>
    <String, dynamic>{
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };
