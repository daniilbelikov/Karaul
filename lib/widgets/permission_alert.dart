import 'package:flutter/material.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';

class PermissionAlert extends StatelessWidget {
  const PermissionAlert({
    Key? key,
    required this.alertTitle,
    required this.alertText,
    required this.onPressed,
  }) : super(key: key);

  final String alertTitle;
  final String alertText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        alertTitle,
        style: TextStyle(
          fontFamily: ConstFonts.boldFont,
          fontSize: 20.0,
        ),
      ),
      content: Text(
        alertText,
        style: TextStyle(
          fontFamily: ConstFonts.regularFont,
          fontSize: 16.0,
          height: 1.2,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).deny,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: ConstFonts.mediumFont,
              fontSize: 14.0,
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Theme.of(context).focusColor,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            S.of(context).accept,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: ConstFonts.mediumFont,
              fontSize: 14.0,
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Theme.of(context).focusColor,
            ),
          ),
        ),
      ],
    );
  }
}
