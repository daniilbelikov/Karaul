// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Calls`
  String get calls {
    return Intl.message(
      'Calls',
      name: 'calls',
      desc: '',
      args: [],
    );
  }

  /// `Signal`
  String get signal {
    return Intl.message(
      'Signal',
      name: 'signal',
      desc: '',
      args: [],
    );
  }

  /// `Geolocation`
  String get geoposition {
    return Intl.message(
      'Geolocation',
      name: 'geoposition',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `What happened?`
  String get callsTitle {
    return Intl.message(
      'What happened?',
      name: 'callsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Press the emergency call button`
  String get callsSubtitle {
    return Intl.message(
      'Press the emergency call button',
      name: 'callsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you in danger?`
  String get signalTitle {
    return Intl.message(
      'Are you in danger?',
      name: 'signalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use an alarm to grab the attention\nof others`
  String get signalSubtitle {
    return Intl.message(
      'Use an alarm to grab the attention\nof others',
      name: 'signalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Countries`
  String get settingsButton {
    return Intl.message(
      'Countries',
      name: 'settingsButton',
      desc: '',
      args: [],
    );
  }

  /// `101`
  String get call101 {
    return Intl.message(
      '101',
      name: 'call101',
      desc: '',
      args: [],
    );
  }

  /// `102`
  String get call102 {
    return Intl.message(
      '102',
      name: 'call102',
      desc: '',
      args: [],
    );
  }

  /// `103`
  String get call103 {
    return Intl.message(
      '103',
      name: 'call103',
      desc: '',
      args: [],
    );
  }

  /// `104`
  String get call104 {
    return Intl.message(
      '104',
      name: 'call104',
      desc: '',
      args: [],
    );
  }

  /// `112`
  String get call112 {
    return Intl.message(
      '112',
      name: 'call112',
      desc: '',
      args: [],
    );
  }

  /// `Fire\ndepartment`
  String get text101 {
    return Intl.message(
      'Fire\ndepartment',
      name: 'text101',
      desc: '',
      args: [],
    );
  }

  /// `Police`
  String get text102 {
    return Intl.message(
      'Police',
      name: 'text102',
      desc: '',
      args: [],
    );
  }

  /// `Ambulance`
  String get text103 {
    return Intl.message(
      'Ambulance',
      name: 'text103',
      desc: '',
      args: [],
    );
  }

  /// `Gas\ndepartment`
  String get text104 {
    return Intl.message(
      'Gas\ndepartment',
      name: 'text104',
      desc: '',
      args: [],
    );
  }

  /// `Call to\nemergency\ncontact`
  String get text105 {
    return Intl.message(
      'Call to\nemergency\ncontact',
      name: 'text105',
      desc: '',
      args: [],
    );
  }

  /// `SMS to\nemergency\ncontact`
  String get text106 {
    return Intl.message(
      'SMS to\nemergency\ncontact',
      name: 'text106',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get settingsTextButton {
    return Intl.message(
      'Edit',
      name: 'settingsTextButton',
      desc: '',
      args: [],
    );
  }

  /// `YOUR INFORMATION`
  String get settingsHeader1 {
    return Intl.message(
      'YOUR INFORMATION',
      name: 'settingsHeader1',
      desc: '',
      args: [],
    );
  }

  /// `EMERGENCY CONTACT`
  String get settingsHeader2 {
    return Intl.message(
      'EMERGENCY CONTACT',
      name: 'settingsHeader2',
      desc: '',
      args: [],
    );
  }

  /// `OTHER`
  String get settingsHeader3 {
    return Intl.message(
      'OTHER',
      name: 'settingsHeader3',
      desc: '',
      args: [],
    );
  }

  /// `Unknow`
  String get settingsUnknow {
    return Intl.message(
      'Unknow',
      name: 'settingsUnknow',
      desc: '',
      args: [],
    );
  }

  /// `Add Actions`
  String get settingsAddAction {
    return Intl.message(
      'Add Actions',
      name: 'settingsAddAction',
      desc: '',
      args: [],
    );
  }

  /// `Send email`
  String get settingsSendEmail {
    return Intl.message(
      'Send email',
      name: 'settingsSendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get settingsRateApp {
    return Intl.message(
      'Rate App',
      name: 'settingsRateApp',
      desc: '',
      args: [],
    );
  }

  /// `Visit our website`
  String get settingsWebsite {
    return Intl.message(
      'Visit our website',
      name: 'settingsWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get settingsSave {
    return Intl.message(
      'Save',
      name: 'settingsSave',
      desc: '',
      args: [],
    );
  }

  /// `Add from contacts`
  String get bottomAddContact {
    return Intl.message(
      'Add from contacts',
      name: 'bottomAddContact',
      desc: '',
      args: [],
    );
  }

  /// `NAME`
  String get bottomName {
    return Intl.message(
      'NAME',
      name: 'bottomName',
      desc: '',
      args: [],
    );
  }

  /// `SURNAME`
  String get bottomSurname {
    return Intl.message(
      'SURNAME',
      name: 'bottomSurname',
      desc: '',
      args: [],
    );
  }

  /// `PHONE NUMBER`
  String get bottomPhone {
    return Intl.message(
      'PHONE NUMBER',
      name: 'bottomPhone',
      desc: '',
      args: [],
    );
  }

  /// `E-MAIL`
  String get bottomEmail {
    return Intl.message(
      'E-MAIL',
      name: 'bottomEmail',
      desc: '',
      args: [],
    );
  }

  /// `MESSAGE`
  String get bottomMessage {
    return Intl.message(
      'MESSAGE',
      name: 'bottomMessage',
      desc: '',
      args: [],
    );
  }

  /// `Determining geolocation...`
  String get geoDetermine {
    return Intl.message(
      'Determining geolocation...',
      name: 'geoDetermine',
      desc: '',
      args: [],
    );
  }

  /// `Track`
  String get geoTrack {
    return Intl.message(
      'Track',
      name: 'geoTrack',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get geoStop {
    return Intl.message(
      'Stop',
      name: 'geoStop',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get geoSend {
    return Intl.message(
      'Send',
      name: 'geoSend',
      desc: '',
      args: [],
    );
  }

  /// `Emergency message`
  String get emergencySubject {
    return Intl.message(
      'Emergency message',
      name: 'emergencySubject',
      desc: '',
      args: [],
    );
  }

  /// `000`
  String get zero {
    return Intl.message(
      '000',
      name: 'zero',
      desc: '',
      args: [],
    );
  }

  /// `999`
  String get nine {
    return Intl.message(
      '999',
      name: 'nine',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get alertErrorTitle {
    return Intl.message(
      'Error',
      name: 'alertErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `All text fields must be filled in.`
  String get alertErrorText {
    return Intl.message(
      'All text fields must be filled in.',
      name: 'alertErrorText',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get alertErrorButton {
    return Intl.message(
      'OK',
      name: 'alertErrorButton',
      desc: '',
      args: [],
    );
  }

  /// `Add information about yourself and your emergency contact in the Settings section.`
  String get alertCallText {
    return Intl.message(
      'Add information about yourself and your emergency contact in the Settings section.',
      name: 'alertCallText',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get alertActionTitle {
    return Intl.message(
      'Success!',
      name: 'alertActionTitle',
      desc: '',
      args: [],
    );
  }

  /// `By long pressing on the app icon, quick actions are available.`
  String get alertActionText {
    return Intl.message(
      'By long pressing on the app icon, quick actions are available.',
      name: 'alertActionText',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `This is an automatic message from the «Karaul!» mobile app.`
  String get header {
    return Intl.message(
      'This is an automatic message from the «Karaul!» mobile app.',
      name: 'header',
      desc: '',
      args: [],
    );
  }

  /// `User `
  String get user {
    return Intl.message(
      'User ',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Location: `
  String get location {
    return Intl.message(
      'Location: ',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Best regards,<br>app team «Karaul!»<br>https://belikov.dev/karaul`
  String get footer {
    return Intl.message(
      'Best regards,<br>app team «Karaul!»<br>https://belikov.dev/karaul',
      name: 'footer',
      desc: '',
      args: [],
    );
  }

  /// ` tried to call fire department.`
  String get fireScript {
    return Intl.message(
      ' tried to call fire department.',
      name: 'fireScript',
      desc: '',
      args: [],
    );
  }

  /// ` tried to call police.`
  String get policeScript {
    return Intl.message(
      ' tried to call police.',
      name: 'policeScript',
      desc: '',
      args: [],
    );
  }

  /// ` tried to call ambulance.`
  String get ambulanceScript {
    return Intl.message(
      ' tried to call ambulance.',
      name: 'ambulanceScript',
      desc: '',
      args: [],
    );
  }

  /// ` tried to call gas department.`
  String get gasScript {
    return Intl.message(
      ' tried to call gas department.',
      name: 'gasScript',
      desc: '',
      args: [],
    );
  }

  /// ` tried to call emergency (112).`
  String get emerScript {
    return Intl.message(
      ' tried to call emergency (112).',
      name: 'emerScript',
      desc: '',
      args: [],
    );
  }

  /// ` was attacked.`
  String get signalScript {
    return Intl.message(
      ' was attacked.',
      name: 'signalScript',
      desc: '',
      args: [],
    );
  }

  /// ` turned on tracking of his own geolocation.`
  String get geoScript {
    return Intl.message(
      ' turned on tracking of his own geolocation.',
      name: 'geoScript',
      desc: '',
      args: [],
    );
  }

  /// `Emergency services`
  String get emergencyTitle {
    return Intl.message(
      'Emergency services',
      name: 'emergencyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Emergency number `
  String get emergencyNumber {
    return Intl.message(
      'Emergency number ',
      name: 'emergencyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Access to geolocation`
  String get geoPerAlertTitle {
    return Intl.message(
      'Access to geolocation',
      name: 'geoPerAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Application «Karaul!» collects location data to enable the function of sending the current address to your emergency contact, even when the app is in the background.`
  String get geoPerTextTitle {
    return Intl.message(
      'Application «Karaul!» collects location data to enable the function of sending the current address to your emergency contact, even when the app is in the background.',
      name: 'geoPerTextTitle',
      desc: '',
      args: [],
    );
  }

  /// `DENY`
  String get deny {
    return Intl.message(
      'DENY',
      name: 'deny',
      desc: '',
      args: [],
    );
  }

  /// `ACCEPT`
  String get accept {
    return Intl.message(
      'ACCEPT',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// ` My location: `
  String get myLocation {
    return Intl.message(
      ' My location: ',
      name: 'myLocation',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
