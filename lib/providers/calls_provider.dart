import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:karaul/widgets/permission_alert.dart';

class CallsProvider with ChangeNotifier {
  final quickActions = const QuickActions();

  Future<AlertDialog?> showPermissonDialog({
    required String alertTitle,
    required String alertText,
    required BuildContext context,
    required Function()? onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return PermissionAlert(
          alertTitle: alertTitle,
          alertText: alertText,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<Response> sendEmail({
    required String userName,
    required String location,
    required String phone,
    required String toContactName,
    required String toContactAddress,
    required String subject,
    required BuildContext context,
  }) async {
    final text = generateEmail(
      userName: userName,
      service: phone,
      address: location,
      context: context,
    );
    final queryParams = {
      'toContactName': toContactName,
      'toContactAddress': toContactAddress,
      'subject': subject,
      'text': text
    };

    final queryString = Uri(queryParameters: queryParams).query;
    final requestUrl = ConstUrls.emailURL + queryString;

    final mainURI = Uri.parse(requestUrl);
    final response = await get(mainURI);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(ConstTexts.exception);
    }
  }

  String generateEmail({
    required String userName,
    required String service,
    required String address,
    required BuildContext context,
  }) {
    late String serviceName;

    switch (service) {
      case '101':
        serviceName = S.of(context).fireScript;
        break;
      case '102':
        serviceName = S.of(context).policeScript;
        break;
      case '103':
        serviceName = S.of(context).ambulanceScript;
        break;
      case '104':
        serviceName = S.of(context).gasScript;
        break;
      case '112':
        serviceName = S.of(context).emerScript;
        break;
      case '000':
        serviceName = S.of(context).signalScript;
        break;
      case '999':
        serviceName = S.of(context).geoScript;
        break;
    }
    return generateEmailText(
      userName: userName,
      serviceName: serviceName,
      address: address,
      context: context,
    );
  }

  String generateEmailText({
    required String userName,
    required String serviceName,
    required String address,
    required BuildContext context,
  }) {
    String hello = S.of(context).hello;
    String header = S.of(context).header;
    String body = S.of(context).user + userName + serviceName;
    String location = S.of(context).location + address;
    String footer = S.of(context).footer;
    return '<p>' +
        hello +
        '</p><p>' +
        header +
        '</p><p>' +
        body +
        '</p><p>' +
        location +
        '</p><p>' +
        footer +
        '<p>';
  }

  Future<void> makeCall(String phone) async {
    String number = 'tel:' + phone;
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }

  Future<void> makeSMS({
    required String phone,
    required String message,
    required String address,
    required BuildContext context,
  }) async {
    String sms = 'sms:' +
        phone +
        '?body=' +
        message +
        S.of(context).myLocation +
        address;
    if (await canLaunch(sms)) {
      await launch(sms);
    } else {
      throw 'Could not launch $sms';
    }
  }

  void initActions({
    required String phone,
    required String message,
    required String address,
    required BuildContext context,
  }) {
    quickActions.initialize((type) {
      if (type == ConstActions.callType) {
        makeCall(phone);
      } else if (type == ConstActions.smsType) {
        makeSMS(
          message: message,
          phone: phone,
          address: address,
          context: context,
        );
      }
    });
  }

  void addActions() {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: ConstActions.callType,
        localizedTitle: ConstActions.call,
        icon: ConstActions.icon,
      ),
      ShortcutItem(
        type: ConstActions.smsType,
        localizedTitle: ConstActions.sms,
        icon: ConstActions.icon,
      ),
    ]);
  }
}
