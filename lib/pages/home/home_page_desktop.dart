import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:provider/provider.dart';
import 'package:ytrendd/widgets/YoutubeVideoList/youtube_video_list_desktop.dart';
import 'package:ytrendd/widgets/home_drawer.dart';

class HomePageDesktop extends StatefulWidget {
  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
    with TickerProviderStateMixin {
  FocusNode _node = new FocusNode();
  TabController _tabController;
  ScrollController _scrollViewController;

  void _handleKey(RawKeyEvent key) {
    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
      if (key.logicalKey == LogicalKeyboardKey.arrowRight) {
        _tabController.index++;
      }

      if (key.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _tabController.index--;
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Country> _allCountries =
        Provider.of<CountriesProvider>(context).allCountries;
    final _selectedCountries =
        _allCountries?.where((country) => country.selected)?.toList();
    if (_selectedCountries == null)
      return Center(child: CircularProgressIndicator());

    _tabController =
        TabController(vsync: this, length: _selectedCountries.length);

    final _sortedSelectedCountries = _selectedCountries
      ..sort((a, b) => a.order.compareTo(b.order));

    return RawKeyboardListener(
      autofocus: true,
      onKey: _handleKey,
      focusNode: _node,
      child: Scaffold(
        drawer: HomeDrawer(),
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  'Ytrendd',
                  style:
                      TextStyle(fontFamily: 'FiraSans_Black', fontSize: 26.0),
                ),
                pinned: true,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: _tabController,
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
            ];
          },
          body: Container(
            child: TabBarView(
              controller: _tabController,
              children: _sortedSelectedCountries.map((Country country) {
                return YoutubeVideoListDesktop(country: country);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
