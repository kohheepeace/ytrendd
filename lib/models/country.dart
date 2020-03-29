import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  String name;
  String code;
  String unicode;
  String emoji;
  int order;

  @JsonKey(defaultValue: false)
  bool selected;

  Country(
      {this.name,
      this.code,
      this.emoji,
      this.unicode,
      this.selected,
      this.order});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
