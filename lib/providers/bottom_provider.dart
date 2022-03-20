import 'package:flutter/material.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:karaul/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:karaul/models/contact_model.dart';
import 'package:karaul/widgets/common_alert.dart';
import 'package:karaul/models/phone_contact_model.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class BottomSheetProvider with ChangeNotifier {
  Future<PhoneContactModel> pickContact() async {
    final contact = await FlutterContactPicker.pickFullContact();
    final name = contact.name?.firstName;
    final surname = contact.name?.lastName;
    final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
    final email = contact.emails.isNotEmpty ? contact.emails.first.email : '';
    return PhoneContactModel(
      name: name ?? '',
      surname: surname ?? '',
      phone: phone ?? '',
      email: email ?? '',
    );
  }

  Future<AlertDialog?> showActionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlert(
          alertTitle: S.of(context).alertActionTitle,
          alertText: S.of(context).alertActionText,
        );
      },
    );
  }

  Future<AlertDialog?> showBottomDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlert(
          alertTitle: S.of(context).alertErrorTitle,
          alertText: S.of(context).alertErrorText,
        );
      },
    );
  }

  Future<AlertDialog?> showCallDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlert(
          alertTitle: S.of(context).alertErrorTitle,
          alertText: S.of(context).alertCallText,
        );
      },
    );
  }

  get getUser {
    final box = Hive.box(ConstKeys.user);
    final name = box.get(ConstKeys.userName) ?? ConstTexts.un;
    final surname = box.get(ConstKeys.userSurname) ?? ConstTexts.know;
    final fullname = name + ' ' + surname;
    final phone = box.get(ConstKeys.userPhone) ?? ConstTexts.unknow;
    final hasData = box.get(ConstKeys.userHasData) ?? false;
    return UserModel(
      name: name,
      surname: surname,
      fullname: fullname,
      phone: phone,
      hasData: hasData,
    );
  }

  get getContact {
    final box = Hive.box(ConstKeys.contact);
    final name = box.get(ConstKeys.contactName) ?? ConstTexts.un;
    final surname = box.get(ConstKeys.contactSurname) ?? ConstTexts.know;
    final fullname = name + ' ' + surname;
    final phone = box.get(ConstKeys.contactPhone) ?? ConstTexts.unknow;
    final email = box.get(ConstKeys.contactEmail) ?? ConstTexts.unknow;
    final message = box.get(ConstKeys.contactMessage) ?? ConstTexts.unknow;
    final hasData = box.get(ConstKeys.contactHasData) ?? false;
    return ContactModel(
      name: name,
      surname: surname,
      fullname: fullname,
      phone: phone,
      email: email,
      message: message,
      hasData: hasData,
    );
  }

  get getBottomUser {
    final box = Hive.box(ConstKeys.user);
    final name = box.get(ConstKeys.userName) ?? '';
    final surname = box.get(ConstKeys.userSurname) ?? '';
    final userFullname = name + ' ' + surname;
    final userPhone = box.get(ConstKeys.userPhone) ?? '';
    final hasData = box.get(ConstKeys.userHasData) ?? false;
    return UserModel(
      name: name,
      surname: surname,
      fullname: userFullname,
      phone: userPhone,
      hasData: hasData,
    );
  }

  get getBottomContact {
    final box = Hive.box(ConstKeys.contact);
    final name = box.get(ConstKeys.contactName) ?? '';
    final surname = box.get(ConstKeys.contactSurname) ?? '';
    final fullname = name + ' ' + surname;
    final phone = box.get(ConstKeys.contactPhone) ?? '';
    final email = box.get(ConstKeys.contactEmail) ?? '';
    final message = box.get(ConstKeys.contactMessage) ?? '';
    final hasData = box.get(ConstKeys.contactHasData) ?? false;
    return ContactModel(
      name: name,
      surname: surname,
      fullname: fullname,
      phone: phone,
      email: email,
      message: message,
      hasData: hasData,
    );
  }

  void saveUserInHive({
    required String userName,
    required String userSurname,
    required String userPhone,
  }) {
    final box = Hive.box(ConstKeys.user);
    box.put(ConstKeys.userName, userName);
    box.put(ConstKeys.userSurname, userSurname);
    box.put(ConstKeys.userPhone, userPhone);
    box.put(ConstKeys.userHasData, true);
    notifyListeners();
  }

  void saveContactInHive({
    required String contactName,
    required String contactSurname,
    required String contactPhone,
    required String contactEmail,
    required String contactMessage,
  }) {
    final box = Hive.box(ConstKeys.contact);
    box.put(ConstKeys.contactName, contactName);
    box.put(ConstKeys.contactSurname, contactSurname);
    box.put(ConstKeys.contactPhone, contactPhone);
    box.put(ConstKeys.contactEmail, contactEmail);
    box.put(ConstKeys.contactMessage, contactMessage);
    box.put(ConstKeys.contactHasData, true);
    notifyListeners();
  }
}
