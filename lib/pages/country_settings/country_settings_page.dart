import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ytrendd/pages/country_settings/country_settings_page_desktop.dart';
import 'package:ytrendd/pages/country_settings/country_settings_page_mobile.dart';

class CountrySettingsPage extends StatelessWidget {
  const CountrySettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: OrientationLayoutBuilder(
        portrait: (context) => CountrySettingsPageMobile(),
        // landscape: (context) => HomeMobileLandscape(),
      ),
      desktop: CountrySettingsPageDesktop(),
    );
  }
}
