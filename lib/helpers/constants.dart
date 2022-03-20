import 'package:flutter/material.dart';

class ConstKeys {
  static String user = 'user';
  static String contact = 'contact';
  static String userName = 'userName';
  static String userSurname = 'userSurname';
  static String userPhone = 'userPhone';
  static String userHasData = 'userHasData';
  static String contactName = 'contactName';
  static String contactSurname = 'contactSurname';
  static String contactPhone = 'contactPhone';
  static String contactEmail = 'contactEmail';
  static String contactMessage = 'contactMessage';
  static String contactHasData = 'contactHasData';
  static String isBought = 'isBought';
  static String emailValue = 'emailValue';
}

class ConstTexts {
  static String un = 'Не';
  static String know = 'определено';
  static String unknow = 'Не определено';
  static String exception = 'Проблемы с подключением к интернету.';
  static String determineLocation = 'Определяем вашу геопозицию...';
  static String determineUnknow = 'не определено';
}

class ConstFonts {
  static String blackFont = 'GothamProBlack';
  static String boldFont = 'GothamProBold';
  static String mediumFont = 'GothamProMedium';
  static String regularFont = 'GothamProRegular';
  static String lightFont = 'GothamProLight';
}

class ConstAssets {
  static String call101 = 'assets/svg/101.svg';
  static String call102 = 'assets/svg/102.svg';
  static String call103 = 'assets/svg/103.svg';
  static String call104 = 'assets/svg/104.svg';
  static String call105 = 'assets/svg/105.svg';
  static String call106 = 'assets/svg/106.svg';
  static String signalAsset = 'assets/svg/signal.svg';
  static String splashAsset = 'assets/png/splash.png';
  static String alarmAsset = 'audio/alarm.mp3';
}

class ConstActions {
  static String call = 'Звонок';
  static String sms = 'Сообщение';
  static String callType = 'contact_call';
  static String smsType = 'contact_sms';
  static String icon = '@mipmap/launcher_icon';
}

class ConstUrls {
  static String emailURL =
      'https://karaulbutton.ru/2/karaul_send_email_feedback.php?';
  static String webSite = 'https://belikov.dev/karaul';
}

class ConstDecorations {
  static BoxDecoration decoration = BoxDecoration(
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Color(0xffEEEEEE),
        blurRadius: 4.0,
        spreadRadius: 2.0,
        offset: Offset(0.0, 0.0),
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
  );

  static BoxDecoration flagDecoration = BoxDecoration(
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Color(0xffEEEEEE),
        blurRadius: 4.0,
        spreadRadius: 2.0,
        offset: Offset(0.0, 0.0),
      ),
    ],
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(100.0),
  );

  static BoxDecoration darkDecoration = BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: const Color(0xff252525).withOpacity(.1),
        blurRadius: 4.0,
        spreadRadius: 2.0,
        offset: const Offset(0.0, 0.0),
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
  );
}
