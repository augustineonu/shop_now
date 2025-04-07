import 'package:flutter/material.dart';
import 'package:shop_now/core/styles/text_style.dart';

const primaryColor = Color(0xff274FED);

const transparent = Colors.transparent;

const black = Color(0xFF1E293B);
const backgroundColor = Color(0xFFD0DAFF);
const textColorDim = Color(0xFF20294A);
const scaffoldBackgroundColor = Color(0xFFF1F3FE);
const oldPalleteColor = Color(0xFFB3B3CC);

///
const secondaryColor = Color(0xff1A1300);
const white = Color(0xFFFFFFFF);
const darkBrown = Color(0xff1a1300);
const success = Color(0xFF02C20F);
const danger = Color(0xFFFF000D);
const shadowColor = Color(0X95E9EBF0);
const disabledColor1 = Color(0x07675750);
const black1 = Color(0xFF14131A);
const red = Color(0xffDF3333);
const redAccent = Color(0xffFEEBEB);
const lightRed = Color(0xffFEEBEB);
const lightBrown = Color(0xffDFD1B0);
const scaffoldColor = Color(0xffF7F8FD);

const borderColor = Color(0xffD4D4D4);

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = white,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? [const BoxShadow(color: shadowColor, blurRadius: 2, spreadRadius: 2)]
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

// colors
Color textColor() {
  return black;
}

Color iconColor() {
  return secondaryColor;
}

Color appColors() {
  return primaryColor;
}

Color scaffold() {
  return scaffoldColor;
}

Color shimmerBaseColor() {
  return Colors.grey.shade300;
}

Color shimmerHighlightColor() {
  return Colors.grey.shade100;
}

// Form decoration
InputDecoration inputDecoration(
    {String? hintText,
    Widget? suffixIcon,
    Color? fillColor,
    Color? borderColor}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(10),
    hintText: hintText,
    errorStyle: const TextStyle(fontSize: 0),
    errorMaxLines: 1,
    filled: true,
    fillColor: fillColor ?? (const Color(0xffF9FAFB)),
    hintStyle: getRegularStyle(color: shadowColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor ?? (const Color(0xffD0D5DD)),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor ?? const Color(0xffD0D5DD),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor ?? const Color(0xffD0D5DD),
        width: 1,
      ),
    ),
    suffixIcon: suffixIcon,
    suffixIconColor: iconColor(),
  );
}
