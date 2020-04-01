import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ytrendd/pages/home/home_page_desktop.dart';
import 'package:ytrendd/pages/home/home_page_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: OrientationLayoutBuilder(
        portrait: (context) => HomePageMobile(),
        // landscape: (context) => HomeMobileLandscape(),
      ),
      desktop: HomePageDesktop(),
    );
  }
}
