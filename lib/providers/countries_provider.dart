import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/utils/all_countries_of_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountriesProvider extends ChangeNotifier {
  List<Country> allCountries;

  void moveCountry(Country sourceCountry, Country targetCountry) async {
    if (targetCountry == sourceCountry) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<Country> _selectedCountries = allCountries
        .where((country) => country.selected)
        .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    final int sourceCountryIndex = _selectedCountries.indexOf(sourceCountry);
    final int targetCountryIndex = _selectedCountries.indexOf(targetCountry);

    // remove sourceCountry from selectedCountry
    _selectedCountries.remove(sourceCountry);

    // insert sourceCountry to selectedCountry
    _selectedCountries.insert(
        sourceCountryIndex > targetCountryIndex
            ? targetCountryIndex
            : targetCountryIndex - 1,
        sourceCountry);

    // update order in selectedCountry => "_selectedCountries" don't have reference but "country" keeps reference.
    _selectedCountries
        .asMap()
        .forEach((index, country) => country.order = index);

    // Country => String
    List<String> newCountriesOfString = allCountries
        .map((Country country) => jsonEncode(country.toJson()))
        .toList();

    // Save to SharedPreferences
    prefs.setStringList('countriesOfString', newCountriesOfString);

    notifyListeners();
  }

  void onSelectCountry(Country country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Find tapped country
    int targetCountryIndex =
        allCountries.indexWhere((element) => element.code == country.code);

    // Edit targetCountry data
    allCountries[targetCountryIndex].selected =
        !allCountries[targetCountryIndex].selected;

    if (allCountries[targetCountryIndex].selected) {
      final _selectedCountries =
          allCountries.where((country) => country.selected).toList();

      allCountries[targetCountryIndex].order = _selectedCountries.length + 1;
    } else {
      allCountries[targetCountryIndex].order = null;
    }

    // Country => String
    List<String> newCountriesOfString = allCountries
        .map((Country country) => jsonEncode(country.toJson()))
        .toList();

    // Save to SharedPreferences
    prefs.setStringList('countriesOfString', newCountriesOfString);

    notifyListeners();
  }

  void fetchAllCountries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> countriesOfString =
        prefs.getStringList('countriesOfString') ?? allCountriesOfString;

    // Decode data from SharedPreferences string
    allCountries = countriesOfString
        .map((jsonString) => Country.fromJson(jsonDecode(jsonString)))
        .toList();
    notifyListeners();
  }
}
