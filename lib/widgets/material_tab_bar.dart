import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/screens/calls_screen.dart';
import 'package:karaul/screens/signal_screen.dart';
import 'package:karaul/helpers/icons/kr_icons.dart';
import 'package:karaul/screens/settings_screen.dart';
import 'package:karaul/providers/tab_bar_provider.dart';
import 'package:karaul/screens/geolocation_screen.dart';
import 'package:karaul/providers/settings_provider.dart';

class MaterialBottomTabBar extends StatelessWidget {
  const MaterialBottomTabBar({Key? key}) : super(key: key);

  final List<Widget> widgets = const <Widget>[
    CallsScreen(),
    SignalScreen(),
    GeolocationScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final tabBarProvider = Provider.of<BottomTabBarProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    settingsProvider.getEmailSwitchValue();
    return Scaffold(
      body: PageView(
        controller: tabBarProvider.pageController,
        onPageChanged: tabBarProvider.onPageChanged,
        children: widgets,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).indicatorColor,
        backgroundColor: Theme.of(context).backgroundColor,
        currentIndex: tabBarProvider.selectedIndex,
        onTap: tabBarProvider.onItemTapped,
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
    );
  }
}
