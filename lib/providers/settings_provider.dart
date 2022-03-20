import 'package:flutter/material.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool boolValue = false;

  get currentValue => boolValue;

  void saveEmailSwitchValue(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(ConstKeys.emailValue, value);
  }

  void getEmailSwitchValue() async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getBool(ConstKeys.emailValue) ?? false;
    boolValue = value;
    notifyListeners();
  }

  void switchState(bool value) async {
    saveEmailSwitchValue(value);
    boolValue = value;
    notifyListeners();
  }

  Future<void> visitWebsite() async {
    final number = ConstUrls.webSite;
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  void requestRatingDialog() async {
    final inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
