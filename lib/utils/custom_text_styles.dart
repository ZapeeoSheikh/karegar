import 'dart:ui';


import 'colors.dart';

class KTextStyles {
  static const normalText = FontWeight.w400;
  static const mediumText = FontWeight.w500;
  static const semiBoldText = FontWeight.w600;
  static const boldText = FontWeight.w700;

  heading({
    Color textColor = KColors.kBlack,
    double fontSize = 18,
    FontWeight fontWeight = boldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  subHeading({
    Color textColor = KColors.kBlack,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  normal({
    Color textColor = KColors.kBlack,
    double fontSize = 14,
    FontWeight fontWeight = normalText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  small({
    Color textColor = KColors.kBlack,
    double fontSize = 10,
    FontWeight fontWeight = normalText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  buttonStyle({
    Color textColor = KColors.kWhite,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  buttonStyle1({
    Color textColor = KColors.kBlack,
    double fontSize = 16,
    FontWeight fontWeight = semiBoldText,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
