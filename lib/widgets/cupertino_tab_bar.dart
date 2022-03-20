import '../generated/l10n.dart';
import '../screens/calls_screen.dart';
import 'package:flutter/material.dart';
import '../screens/signal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../helpers/icons/kr_icons.dart';
import '../screens/settings_screen.dart';
import '../screens/geolocation_screen.dart';
import '../providers/settings_provider.dart';

class CupertinoBottomTabBar extends StatefulWidget {
  const CupertinoBottomTabBar({Key? key}) : super(key: key);

  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoBottomTabBar> {
  final List<Widget> widgets = const <Widget>[
    CallsScreen(),
    SignalScreen(),
    GeolocationScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    settingsProvider.getEmailSwitchValue();
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).backgroundColor,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).indicatorColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: S.of(context).calls,
              icon: const Icon(
                KrIcons.sos,
                size: 20.0,
              ),
            ),
            BottomNavigationBarItem(
              label: S.of(context).signal,
              icon: const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(
                  KrIcons.wave,
                  size: 20.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: S.of(context).geoposition,
              icon: const Icon(
                KrIcons.geolocation,
                size: 20.0,
              ),
            ),
            BottomNavigationBarItem(
              label: S.of(context).settings,
              icon: const Icon(
                KrIcons.settings,
                size: 20.0,
              ),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return widgets[index];
        },
      ),
    );
  }
}
