import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:ytrendd/http_client.dart';
import 'package:ytrendd/pages/country_settings.dart';
import 'package:ytrendd/pages/home_page.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:provider/provider.dart';

void main() {
  dio.interceptors.add(
      DioCacheManager(CacheConfig(defaultMaxAge: Duration(hours: 12)))
          .interceptor);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountriesProvider>(
            create: (context) => CountriesProvider()..fetchAllCountries()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/country-settings': (context) => CountrySettingsPage(),
        },
      ),
    );
  }
}
