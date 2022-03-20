import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    primaryColor: const Color(0xff3F95AD),
    indicatorColor: const Color(0xff676767),
    backgroundColor: const Color(0xffF6F7FB),
    cardColor: const Color(0xffFFFFFF),
    canvasColor: const Color(0xff252525),
    shadowColor: const Color(0xff494949),
    errorColor: const Color(0xffE25038),
    dividerColor: const Color(0xffEDEDED),
    focusColor: const Color(0x223F95AD),
    highlightColor: const Color(0xff8A8A8A),
    hintColor: const Color(0xffEFEFEF),
  );

  static final dark = ThemeData.dark().copyWith(
    splashColor: Colors.transparent,
    primaryColor: const Color(0xff3F95AD),
    indicatorColor: const Color(0xff676767),
    backgroundColor: const Color(0xffF6F7FB),
    cardColor: const Color(0xffFFFFFF),
    canvasColor: const Color(0xff252525),
    shadowColor: const Color(0xff494949),
    errorColor: const Color(0xffE25038),
    dividerColor: const Color(0xffEDEDED),
    focusColor: const Color(0x223F95AD),
    highlightColor: const Color(0xff8A8A8A),
    hintColor: const Color(0xffEFEFEF),
  );
}
