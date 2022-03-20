import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:karaul/helpers/constants.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key? key,
    this.onPressed,
    required this.primary,
    required this.text,
  }) : super(key: key);

  final String text;
  final Color primary;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontFamily: ConstFonts.mediumFont,
            fontSize: 12.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: primary,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
