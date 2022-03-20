import 'dart:io';
import 'utils/no_glow.dart';
import 'generated/l10n.dart';
import 'helpers/themes.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'providers/calls_provider.dart';
import 'providers/bottom_provider.dart';
import 'providers/signal_provider.dart';
import 'package:provider/provider.dart';
import 'providers/tab_bar_provider.dart';
import 'providers/settings_provider.dart';
import 'providers/geolocation_provider.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:karaul/widgets/material_tab_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:karaul/widgets/cupertino_tab_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class KaraulApp extends StatelessWidget {
  const KaraulApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomTabBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CallsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignalProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GeolocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomSheetProvider(),
        ),
      ],
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: Themes.light,
        dark: Themes.dark,
        builder: (light, dark) {
          return Sizer(
            builder: (_, orientation, deviceType) {
              return MaterialApp(
                theme: light,
                darkTheme: dark,
                scrollBehavior: NoGlowScrollBehavior(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: AnimatedSplashScreen(
                  duration: 500,
                  splashIconSize: 200.0,
                  splash: ConstAssets.splashAsset,
                  nextScreen: Platform.isAndroid
                      ? const MaterialBottomTabBar()
                      : const CupertinoBottomTabBar(),
                  backgroundColor: const Color(0xffF6F7FB),
                  pageTransitionType: PageTransitionType.fade,
                  splashTransition: SplashTransition.fadeTransition,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
