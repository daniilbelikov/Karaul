import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/widgets/main_header.dart';
import 'package:karaul/providers/calls_provider.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/widgets/user_bottom_sheet.dart';
import 'package:karaul/providers/settings_provider.dart';
import 'package:karaul/helpers/icons/settings_icons.dart';
import 'package:karaul/widgets/contact_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                MainHeader(
                  isCall: false,
                  hasButton: true,
                  titleText: S.of(context).settingsTitle,
                  phone: S.of(context).settingsButton,
                  fontSize: 11.sp,
                ),
                SettingsHeaderRow(
                  hasButton: true,
                  text: S.of(context).settingsHeader1,
                  onPressed: () => showUserBottomSheet(
                    name: bottomProvider.getBottomUser.name,
                    surname: bottomProvider.getBottomUser.surname,
                    phone: bottomProvider.getBottomUser.phone,
                  ),
                ),
                const SettingsUserBlock(),
                SizedBox(
                  height: 12.sp,
                ),
                SettingsHeaderRow(
                  hasButton: true,
                  text: S.of(context).settingsHeader2,
                  onPressed: () => showContactBottomSheet(
                    name: bottomProvider.getBottomContact.name,
                    surname: bottomProvider.getBottomContact.surname,
                    phone: bottomProvider.getBottomContact.phone,
                    email: bottomProvider.getBottomContact.email,
                    message: bottomProvider.getBottomContact.message,
                  ),
                ),
                const SettingsContactBlock(),
                SizedBox(
                  height: 12.sp,
                ),
                SettingsHeaderRow(
                  hasButton: false,
                  text: S.of(context).settingsHeader3,
                  onPressed: null,
                ),
                const SettingsAnotherBlock(),
                SizedBox(
                  height: 18.sp,
                ),
                const SettingsActionButton(),
                SizedBox(
                  height: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showUserBottomSheet({
    required String name,
    required String surname,
    required String phone,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => UserBottomSheet(
        name: name,
        surname: surname,
        phone: phone,
      ),
    );
  }

  void showContactBottomSheet({
    required String name,
    required String surname,
    required String phone,
    required String email,
    required String message,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => ContactBottomSheet(
        name: name,
        surname: surname,
        phone: phone,
        email: email,
        message: message,
      ),
    );
  }
}

class SettingsUserBlock extends StatelessWidget {
  const SettingsUserBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Container(
      decoration: ConstDecorations.decoration,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          SettingsIconTextRow(
            icon: SettingsIcons.person,
            text: bottomProvider.getUser.fullname,
            height: 38.sp,
          ),
          SettingsIconTextRow(
            icon: SettingsIcons.telephone,
            text: bottomProvider.getUser.phone,
            height: 38.sp,
          ),
        ],
      ),
    );
  }
}

class SettingsContactBlock extends StatelessWidget {
  const SettingsContactBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Container(
      decoration: ConstDecorations.decoration,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          SettingsIconTextRow(
            icon: SettingsIcons.person,
            text: bottomProvider.getContact.fullname,
            height: 38.sp,
          ),
          SettingsIconTextRow(
            icon: SettingsIcons.telephone,
            text: bottomProvider.getContact.phone,
            height: 38.sp,
          ),
          SettingsIconTextRow(
            icon: SettingsIcons.at,
            text: bottomProvider.getContact.email,
            height: 38.sp,
          ),
          SettingsIconTextRow(
            icon: SettingsIcons.dialog,
            text: bottomProvider.getContact.message,
            height: 38.sp,
          ),
        ],
      ),
    );
  }
}

class SettingsAnotherBlock extends StatelessWidget {
  const SettingsAnotherBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: ConstDecorations.decoration,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          SettingsTextSwitchRow(
            text: S.of(context).settingsSendEmail,
            hasSwitch: true,
            hasDivider: true,
            onTap: () {},
          ),
          SettingsTextSwitchRow(
            text: S.of(context).settingsRateApp,
            hasSwitch: false,
            hasDivider: true,
            onTap: () => settingsProvider.requestRatingDialog(),
          ),
          SettingsTextSwitchRow(
            text: S.of(context).settingsWebsite,
            hasSwitch: false,
            hasDivider: false,
            onTap: () => settingsProvider.visitWebsite(),
          ),
        ],
      ),
    );
  }
}

class SettingsIconTextRow extends StatelessWidget {
  const SettingsIconTextRow({
    Key? key,
    required this.icon,
    required this.height,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final double? height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16.0),
      height: height,
      child: Row(
        children: [
          const SizedBox(
            width: 16.0,
          ),
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontFamily: ConstFonts.mediumFont,
                fontSize: 12.sp,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTextSwitchRow extends StatelessWidget {
  const SettingsTextSwitchRow({
    Key? key,
    this.onTap,
    required this.text,
    required this.hasSwitch,
    required this.hasDivider,
  }) : super(key: key);

  final String text;
  final bool hasSwitch;
  final bool hasDivider;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 38.sp,
        child: Column(
          children: [
            SizedBox(
              height: 37.sp,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontFamily: ConstFonts.regularFont,
                      fontSize: 12.sp,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  if (hasSwitch)
                    Platform.isAndroid
                        ? Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Theme.of(context).primaryColor,
                            value: settingsProvider.currentValue,
                            onChanged: (value) =>
                                settingsProvider.switchState(value),
                          )
                        : CupertinoSwitch(
                            activeColor: Theme.of(context).primaryColor,
                            value: settingsProvider.currentValue,
                            onChanged: (value) =>
                                settingsProvider.switchState(value),
                          ),
                  const SizedBox(
                    width: 4.0,
                  ),
                ],
              ),
            ),
            if (hasDivider)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  color: Theme.of(context).hintColor,
                  height: 1.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SettingsActionButton extends StatelessWidget {
  const SettingsActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    final callsProvider = Provider.of<CallsProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: 38.sp,
      child: ElevatedButton(
        onPressed: () {
          callsProvider.addActions();
          bottomProvider.showActionsDialog(context);
        },
        child: Text(
          S.of(context).settingsAddAction,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontFamily: ConstFonts.mediumFont,
            fontSize: 12.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).canvasColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

class SettingsHeaderRow extends StatelessWidget {
  const SettingsHeaderRow({
    Key? key,
    required this.text,
    required this.hasButton,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool hasButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontFamily: ConstFonts.mediumFont,
              fontSize: 10.sp,
            ),
          ),
          if (hasButton)
            TextButton(
              onPressed: onPressed,
              child: Text(
                S.of(context).settingsTextButton,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: ConstFonts.mediumFont,
                  fontSize: 12.sp,
                ),
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Theme.of(context).focusColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
