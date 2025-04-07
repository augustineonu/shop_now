// Text styles
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_now/core/constants/color_pallete.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'Avenir',
    fontWeight: fontWeight,
    color: color,
  );
}

// regular style
TextStyle getRegularStyle({double fontSize = 14.0, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w400,
    color ?? textColor(),
  );
}

// light text style
TextStyle getLightStyle({double fontSize = 14.0, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w300,
    color ?? textColor(),
  );
}

// bold text style
TextStyle getBoldStyle(
    {double fontSize = 14.0, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontSize,
    fontWeight ?? FontWeight.w700,
    color ?? textColor(),
  );
}

// semiBold style
TextStyle getSemiBoldStyle({double fontSize = 14.0, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w600,
    color ?? textColor(),
  );
}

// extrabold text style
TextStyle getExtraBoldStyle({double fontSize = 14.0, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w900,
    color ?? textColor(),
  );
}

// medium text style
TextStyle getMediumStyle({double fontSize = 14.0, Color? color}) {
  return _getTextStyle(
    fontSize.sp,
    FontWeight.w500,
    color ?? textColor(),
  );
}
