import 'package:flutter/material.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:ytrendd/widgets/all_country_tile.dart';
import 'package:ytrendd/widgets/selected_country_tile.dart';
import 'package:provider/provider.dart';

class CountrySettingsPageDesktop extends StatefulWidget {
  @override
  _CountrySettingsPageDesktopState createState() =>
      _CountrySettingsPageDesktopState();
}

class _CountrySettingsPageDesktopState
    extends State<CountrySettingsPageDesktop> {
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;

    final _allCountries = Provider.of<CountriesProvider>(context).allCountries
      ..sort((a, b) => a.name.compareTo(b.name));
    final _selectedCountries = _allCountries
        ?.where((country) => country.selected)
        ?.toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    return Scaffold(
      appBar: AppBar(
        title: Text("Country Settings"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 240.0, vertical: 20.0),
        children: [
          ListTile(title: Text('Selected Countries', style: headerStyle)),
          ..._selectedCountries.map((country) => SelectedCountryTile(country)),
          ListTile(title: Text('All Countries', style: headerStyle)),
          ..._allCountries.map((country) => AllCountryTile(country)),
        ],
      ),
    );
  }
}
