import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          image: AssetImage('assets/logo/ytrendd-512x512.png')),
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
    );
  }
}
