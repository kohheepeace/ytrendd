import 'package:flutter/material.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:ytrendd/widgets/YoutubeVideoList/youtube_video_list_mobile.dart';
import 'package:provider/provider.dart';
import 'package:ytrendd/widgets/home_drawer.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Country> _allCountries =
        Provider.of<CountriesProvider>(context).allCountries;
    final _selectedCountries =
        _allCountries?.where((country) => country.selected)?.toList();
    if (_selectedCountries == null) return CircularProgressIndicator();

    final _sortedSelectedCountries = _selectedCountries
      ..sort((a, b) => a.order.compareTo(b.order));

    return DefaultTabController(
      length: _sortedSelectedCountries.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Ytrendd',
            style: TextStyle(
                fontFamily: 'FiraSans_Black',
                fontStyle: FontStyle.italic,
                fontSize: 26.0),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: _sortedSelectedCountries
                .map((Country country) => Tab(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${country.emoji}',
                            style: TextStyle(
                              fontFamily: 'NotoColorEmoji',
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text('${country.name}'),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        drawer: HomeDrawer(),
        body: TabBarView(
          children: _sortedSelectedCountries.map((Country country) {
            return YoutubeVideoListMobile(
                key: Key(country.code), country: country);
          }).toList(),
        ),
      ),
    );
  }
}
