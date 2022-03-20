import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/utils/route_wraper.dart';
import 'package:karaul/helpers/icons/kr_icons.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/screens/countries_screen.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/providers/settings_provider.dart';
import 'package:karaul/providers/geolocation_provider.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key? key,
    this.hasButton = false,
    this.phone = '',
    this.buttonIcon = KrIcons.world,
    this.subtitleText = '',
    required this.isCall,
    required this.titleText,
    required this.fontSize,
  }) : super(key: key);

  final bool isCall;
  final bool hasButton;
  final String phone;
  final String titleText;
  final String subtitleText;
  final IconData buttonIcon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final callsProvider = Provider.of<CallsProvider>(context);
    final geoProvider = Provider.of<GeolocationProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 40.sp,
        ),
        SizedBox(
          height: 27.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: TextStyle(
                  fontFamily: ConstFonts.mediumFont,
                  color: Theme.of(context).canvasColor,
                  fontSize: 18.sp,
                ),
              ),
              if (hasButton)
                ElevatedButton(
                  child: Row(
                    children: [
                      Icon(
                        buttonIcon,
                        size: 10.sp,
                      ),
                      SizedBox(
                        width: 4.sp,
                      ),
                      Text(
                        phone,
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontFamily: ConstFonts.mediumFont,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {
                    if (isCall) {
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
                    } else {
                      RouteWraper.push(
                        context,
                        const CountriesScreen(),
                      );
                    }
                  },
                ),
            ],
          ),
        ),
        if (subtitleText.isNotEmpty)
          SizedBox(
            height: 12.sp,
          ),
        if (subtitleText.isNotEmpty)
          Row(
            children: [
              Text(
                subtitleText,
                style: TextStyle(
                  color: Theme.of(context).shadowColor,
                  fontFamily: ConstFonts.regularFont,
                  fontSize: 13.sp,
                  height: 1.20,
                ),
              ),
            ],
          ),
        SizedBox(
          height: 12.sp,
        ),
      ],
    );
  }
}
