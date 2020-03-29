import 'dart:convert';
import 'package:ytrendd/utils/all_countries_of_json.dart';

List<String> allCountriesOfString =
    allCountriesOfJson.map((json) => jsonEncode(json)).toList();
