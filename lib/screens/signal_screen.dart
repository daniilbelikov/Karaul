import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/widgets/main_header.dart';
import 'package:karaul/utils/sprite_painter.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/providers/signal_provider.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/providers/settings_provider.dart';
import 'package:karaul/providers/geolocation_provider.dart';

class SignalScreen extends StatefulWidget {
  const SignalScreen({Key? key}) : super(key: key);

  @override
  _SignalScreenState createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void _initialization() {
    _animationController = AnimationController(
      vsync: this,
    );
  }

  void _startAnimation() {
    _animationController.stop();
    _animationController.reset();
    _animationController.repeat(
      period: const Duration(seconds: 1),
    );
  }

  void _finishAnimation() {
    _animationController.dispose();
  }

  @override
  void initState() {
    _initialization();
    _startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _finishAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    final signalProvider = Provider.of<SignalProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            MainHeader(
              isCall: false,
              hasButton: false,
              titleText: S.of(context).signalTitle,
              subtitleText: S.of(context).signalSubtitle,
              fontSize: 0.0,
            ),
            Expanded(
              child: Container(),
            ),
            CustomPaint(
              painter: SpritePainter(_animationController),
              child: Center(
                child: SizedBox(
                  height: 100.sp,
                  width: 100.sp,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).errorColor,
                      shape: const CircleBorder(),
                      elevation: 0.0,
                    ),
                    child: SizedBox(
                      height: 35.sp,
                      width: 35.sp,
                      child: SvgPicture.asset(
                        ConstAssets.signalAsset,
                      ),
                    ),
                    onPressed: () {
                      signalProvider.startAudio();

                      if (settingsProvider.currentValue &&
                          signalProvider.currentPlayingState) {
                        callsProvider.sendEmail(
                          context: context,
                          phone: S.of(context).zero,
                          userName: bottomProvider.getUser.fullname,
                          location: geoProvider.callAddressState,
                          subject: S.of(context).emergencySubject,
                          toContactName: bottomProvider.getContact.fullname,
                          toContactAddress: bottomProvider.getContact.email,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
