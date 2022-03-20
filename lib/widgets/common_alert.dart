import 'package:flutter/material.dart';
import 'package:karaul/generated/l10n.dart';
import 'package:karaul/helpers/constants.dart';

class CommonAlert extends StatelessWidget {
  const CommonAlert({
    Key? key,
    required this.alertTitle,
    required this.alertText,
  }) : super(key: key);

  final String alertTitle;
  final String alertText;

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
            S.of(context).alertErrorButton,
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
