import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karaul/helpers/constants.dart';

class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    Key? key,
    this.maskFormatter,
    required this.icon,
    required this.keyboardType,
    required this.defaultFormatter,
    required this.controller,
  }) : super(key: key);

  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextInputFormatter? maskFormatter;
  final FilteringTextInputFormatter defaultFormatter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              autocorrect: false,
              controller: controller,
              keyboardType: keyboardType,
              cursorColor: Theme.of(context).canvasColor,
              inputFormatters:
                  maskFormatter != null ? [maskFormatter!] : [defaultFormatter],
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontFamily: ConstFonts.regularFont,
                fontSize: 12.sp,
                height: 1.2,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
