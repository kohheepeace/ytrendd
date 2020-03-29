// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    code: json['code'] as String,
    emoji: json['emoji'] as String,
    unicode: json['unicode'] as String,
    selected: json['selected'] as bool ?? false,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'unicode': instance.unicode,
      'emoji': instance.emoji,
      'order': instance.order,
      'selected': instance.selected,
    };
