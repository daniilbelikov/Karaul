import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';

class BottomHeaderText extends StatelessWidget {
  const BottomHeaderText({
    Key? key,
    required this.hasButton,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final bool hasButton;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontFamily: ConstFonts.mediumFont,
              fontSize: 9.sp,
            ),
          ),
          if (hasButton)
            TextButton(
              onPressed: onPressed,
              child: Text(
                S.of(context).bottomAddContact,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: ConstFonts.mediumFont,
                  fontSize: 9.sp,
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
