import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/widgets/main_header.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:karaul/helpers/icons/kr_icons.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/providers/settings_provider.dart';
import 'package:karaul/providers/geolocation_provider.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final callsProvider = Provider.of<CallsProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);

    if (bottomProvider.getBottomContact.hasData) {
      callsProvider.initActions(
        phone: bottomProvider.getBottomContact.phone,
        message: bottomProvider.getBottomContact.message,
        address: geoProvider.callAddressState,
        context: context,
      );
    }

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied && Platform.isAndroid) {
        callsProvider.showPermissonDialog(
          alertTitle: S.of(context).geoPerAlertTitle,
          alertText: S.of(context).geoPerTextTitle,
          context: key.currentContext!,
          onPressed: () {
            Navigator.pop(context);
            geoProvider.getCurrentLocation();
          },
        );
      } else if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        geoProvider.getCurrentLocation();
      }
    });

    return Scaffold(
      key: key,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            MainHeader(
              isCall: true,
              hasButton: true,
              buttonIcon: KrIcons.call,
              titleText: S.of(context).callsTitle,
              subtitleText: S.of(context).callsSubtitle,
              phone: S.of(context).call112,
              fontSize: 13.sp,
            ),
            CallsCardsExpanded(
              fireContact: S.of(context).call101,
              policeContact: S.of(context).call102,
              ambulanceContact: S.of(context).call103,
              gasContact: S.of(context).call104,
              emerContactCall: bottomProvider.getContact.phone,
            ),
            SizedBox(
              height: 12.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class CallsCardsExpanded extends StatelessWidget {
  const CallsCardsExpanded({
    Key? key,
    required this.fireContact,
    required this.policeContact,
    required this.ambulanceContact,
    required this.gasContact,
    required this.emerContactCall,
  }) : super(key: key);

  final String fireContact;
  final String policeContact;
  final String ambulanceContact;
  final String gasContact;
  final String emerContactCall;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          CallsHeaderRow(
            fireContact: fireContact,
            policeContact: policeContact,
          ),
          CallsBodyRow(
            ambContact: ambulanceContact,
            gasContact: gasContact,
          ),
          CallsFooterRow(
            emerContact: emerContactCall,
          ),
        ],
      ),
    );
  }
}

class CallsHeaderRow extends StatelessWidget {
  const CallsHeaderRow({
    Key? key,
    required this.fireContact,
    required this.policeContact,
  }) : super(key: key);

  final String fireContact;
  final String policeContact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CallsCard(
            phone: fireContact,
            assetName: ConstAssets.call101,
            textBackground: S.of(context).call101,
            textForeground: S.of(context).text101,
          ),
          CallsCard(
            phone: policeContact,
            assetName: ConstAssets.call102,
            textBackground: S.of(context).call102,
            textForeground: S.of(context).text102,
          ),
        ],
      ),
    );
  }
}

class CallsBodyRow extends StatelessWidget {
  const CallsBodyRow({
    Key? key,
    required this.ambContact,
    required this.gasContact,
  }) : super(key: key);

  final String ambContact;
  final String gasContact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CallsCard(
            phone: ambContact,
            assetName: ConstAssets.call103,
            textBackground: S.of(context).call103,
            textForeground: S.of(context).text103,
          ),
          CallsCard(
            phone: gasContact,
            assetName: ConstAssets.call104,
            textBackground: S.of(context).call104,
            textForeground: S.of(context).text104,
          ),
        ],
      ),
    );
  }
}

class CallsFooterRow extends StatelessWidget {
  const CallsFooterRow({
    Key? key,
    required this.emerContact,
  }) : super(key: key);

  final String emerContact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CallsSpecialCard(
            isCall: true,
            phone: emerContact,
            assetName: ConstAssets.call105,
            textForeground: S.of(context).text105,
          ),
          CallsSpecialCard(
            isCall: false,
            phone: emerContact,
            assetName: ConstAssets.call106,
            textForeground: S.of(context).text106,
          ),
        ],
      ),
    );
  }
}

class CallsCard extends StatelessWidget {
  const CallsCard({
    Key? key,
    required this.phone,
    required this.assetName,
    required this.textForeground,
    required this.textBackground,
  }) : super(key: key);

  final String phone;
  final String assetName;
  final String textForeground;
  final String textBackground;

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    return Expanded(
      child: Bounce(
        duration: const Duration(milliseconds: 100),
        onPressed: () {
          callsProvider.makeCall(phone);

          if (settingsProvider.currentValue) {
            callsProvider.sendEmail(
              phone: phone,
              context: context,
              userName: bottomProvider.getUser.fullname,
              location: geoProvider.callAddressState,
              subject: S.of(context).emergencySubject,
              toContactName: bottomProvider.getContact.fullname,
              toContactAddress: bottomProvider.getContact.email,
            );
          }
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          shadowColor: Colors.transparent,
          elevation: 0.0,
          child: Container(
            decoration: ConstDecorations.decoration,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    assetName,
                    height: 10.h,
                    width: 10.h,
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 36.sp,
                            child: Text(
                              textBackground,
                              style: TextStyle(
                                color: Theme.of(context).dividerColor,
                                fontFamily: ConstFonts.boldFont,
                                fontSize: 44.sp,
                              ),
                            ),
                          ),
                          Text(
                            textForeground,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontFamily: ConstFonts.mediumFont,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CallsSpecialCard extends StatelessWidget {
  const CallsSpecialCard({
    Key? key,
    required this.isCall,
    required this.phone,
    required this.assetName,
    required this.textForeground,
  }) : super(key: key);

  final bool isCall;
  final String phone;
  final String assetName;
  final String textForeground;

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Expanded(
      child: Bounce(
        duration: const Duration(milliseconds: 100),
        onPressed: () {
          if (bottomProvider.getContact.hasData &&
              bottomProvider.getUser.hasData) {
            isCall
                ? callsProvider.makeCall(phone)
                : callsProvider.makeSMS(
                    phone: phone,
                    message: bottomProvider.getContact.message,
                    address: geoProvider.callAddressState,
                    context: context,
                  );
          } else {
            bottomProvider.showCallDialog(context);
          }
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          shadowColor: Colors.transparent,
          elevation: 0.0,
          child: Container(
            decoration: ConstDecorations.decoration,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    assetName,
                    width: 10.h,
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Text(
                            textForeground,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).canvasColor,
                              fontFamily: ConstFonts.mediumFont,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
