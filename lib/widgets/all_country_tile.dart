import 'package:flutter/material.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:provider/provider.dart';

class AllCountryTile extends StatelessWidget {
  final Country country;

  AllCountryTile(this.country);

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: country.selected,
          onChanged: (bool newValue) {
            Provider.of<CountriesProvider>(context, listen: false)
                .onSelectCountry(country);
          },
        ),
        title: Text('${country.name}'),
        trailing: Text(
          '${country.emoji}',
          style: TextStyle(
            fontFamily: 'NotoColorEmoji',
          ),
        ),
      ),
    );
  }
}
