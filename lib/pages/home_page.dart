import 'package:flutter/material.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:ytrendd/widgets/youtube_videos_list.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
                .map((Country country) =>
                    Tab(text: '${country.emoji} ${country.name}'))
                .toList(),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: CircleAvatar(
                          child: Image(
                              image: AssetImage(
                                  'assets/logo/ytrendd-512x512.png')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.flight_takeoff,
                ),
                title: Text('Countries Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/country-settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Support and community'),
                onTap: () async {
                  final url = 'https://spectrum.chat/ytrendd';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: _sortedSelectedCountries.map((Country country) {
            return YoutubeVideosList(key: Key(country.code), country: country);
          }).toList(),
        ),
      ),
    );
  }
}
