import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/widgets/bottom_header_text.dart';
import 'package:karaul/widgets/bottom_sheet_button.dart';
import 'package:karaul/helpers/icons/settings_icons.dart';
import 'package:karaul/widgets/bottom_sheet_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactBottomSheet extends StatefulWidget {
  const ContactBottomSheet({
    Key? key,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.message,
  }) : super(key: key);

  final String name;
  final String surname;
  final String phone;
  final String email;
  final String message;

  @override
  State<ContactBottomSheet> createState() => _UserBottomSheetState();
}

class _UserBottomSheetState extends State<ContactBottomSheet> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  final maskFormatter = MaskTextInputFormatter(
    mask: '+#-###-###-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final defaultFormatter = FilteringTextInputFormatter.allow(
    RegExp("[a-zA-Zа-яА-Я0-9@.,:!?-_ ]"),
  );

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    surnameController = TextEditingController(text: widget.surname);
    phoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);
    messageController = TextEditingController(text: widget.message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Padding(
      padding: mediaQueryData.viewInsets / 1.3,
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomHeaderText(
                  text: S.of(context).bottomName,
                  hasButton: true,
                  onPressed: () {
                    bottomProvider.pickContact().then((contact) {
                      setState(() {
                        nameController = TextEditingController(
                          text: contact.name,
                        );
                        surnameController = TextEditingController(
                          text: contact.surname,
                        );
                        phoneController = TextEditingController(
                          text: contact.phone,
                        );
                        emailController = TextEditingController(
                          text: contact.email,
                        );
                      });
                    });
                  },
                ),
                BottomSheetTextField(
                  controller: nameController,
                  icon: SettingsIcons.person,
                  keyboardType: TextInputType.name,
                  defaultFormatter: defaultFormatter,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                BottomHeaderText(
                  text: S.of(context).bottomSurname,
                  hasButton: false,
                ),
                BottomSheetTextField(
                  controller: surnameController,
                  icon: SettingsIcons.person,
                  keyboardType: TextInputType.name,
                  defaultFormatter: defaultFormatter,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                BottomHeaderText(
                  text: S.of(context).bottomPhone,
                  hasButton: false,
                ),
                BottomSheetTextField(
                  controller: phoneController,
                  icon: SettingsIcons.telephone,
                  keyboardType: TextInputType.phone,
                  maskFormatter: maskFormatter,
                  defaultFormatter: defaultFormatter,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                BottomHeaderText(
                  text: S.of(context).bottomEmail,
                  hasButton: false,
                ),
                BottomSheetTextField(
                  controller: emailController,
                  icon: SettingsIcons.at,
                  keyboardType: TextInputType.emailAddress,
                  defaultFormatter: defaultFormatter,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                BottomHeaderText(
                  text: S.of(context).bottomMessage,
                  hasButton: false,
                ),
                BottomSheetTextField(
                  controller: messageController,
                  icon: SettingsIcons.dialog,
                  keyboardType: TextInputType.multiline,
                  defaultFormatter: defaultFormatter,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                SizedBox(
                  height: 18.sp,
                ),
                BottomSheetButton(
                  primary: Theme.of(context).primaryColor,
                  text: S.of(context).settingsSave,
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        surnameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        messageController.text.isNotEmpty) {
                      bottomProvider.saveContactInHive(
                        contactName: nameController.text,
                        contactSurname: surnameController.text,
                        contactPhone: phoneController.text,
                        contactEmail: emailController.text,
                        contactMessage: messageController.text,
                      );
                      Navigator.pop(context);
                    } else {
                      bottomProvider.showBottomDialog(context);
                    }
                  },
                ),
                SizedBox(
                  height: Platform.isAndroid ? 0.sp : 18.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
