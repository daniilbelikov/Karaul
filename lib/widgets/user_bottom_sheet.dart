import 'dart:io';
import 'package:sizer/sizer.dart';
import 'bottom_sheet_text_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/providers/bottom_provider.dart';
import 'package:karaul/widgets/bottom_header_text.dart';
import 'package:karaul/widgets/bottom_sheet_button.dart';
import 'package:karaul/helpers/icons/settings_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserBottomSheet extends StatefulWidget {
  const UserBottomSheet({
    Key? key,
    required this.name,
    required this.surname,
    required this.phone,
  }) : super(key: key);

  final String name;
  final String surname;
  final String phone;

  @override
  _UserBottomSheetState createState() => _UserBottomSheetState();
}

class _UserBottomSheetState extends State<UserBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomSheetProvider>(context);
    return Padding(
      padding: MediaQuery.of(context).viewInsets / 1.3,
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
                  hasButton: false,
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
                  height: 18.sp,
                ),
                BottomSheetButton(
                  primary: Theme.of(context).primaryColor,
                  text: S.of(context).settingsSave,
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        surnameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      bottomProvider.saveUserInHive(
                        userName: nameController.text,
                        userSurname: surnameController.text,
                        userPhone: phoneController.text,
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
