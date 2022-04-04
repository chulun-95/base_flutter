import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get w400 {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get italic {
    return copyWith(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get semiBoldDisable {
    return copyWith(fontWeight: FontWeight.w600, color: Colors.black38);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setFontWeight(FontWeight fontWeight) {
    return copyWith(fontWeight: fontWeight);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class TextStyles {
  static const double _height = 1.4;

  static final TextStyle _defaultStyle = TextStyle(
    fontSize: 14.sp,
    height: _height,
  );

  /// Text use for heading text
  ///
  /// Default: size: 20, weight: bold
  static TextStyle headingText = _defaultStyle.copyWith(fontSize: 20.sp).bold;

  /// Text use for big button, button in card, navbar title, header of list, loading text, ...
  ///
  /// Default: size: 16, weight: semibold
  static TextStyle headerText =
      _defaultStyle.copyWith(fontSize: 16.sp).semiBold;

  /// Text use for big button, button in card, navbar title, header of list, loading text, ...
  ///
  /// Default: size: 13, weight: semibold
  static TextStyle semiBoldText =
      _defaultStyle.copyWith(fontSize: 13.sp).semiBold;

  /// Text use for regular button
  ///
  /// Default: size: 15, weight: regular
  static TextStyle buttonText = _defaultStyle.copyWith(fontSize: 15.sp).regular;

  /// Text use for normal text in project
  ///
  /// Default: size: 14, weight: regular
  static TextStyle normalText = _defaultStyle.regular;

  /// Text use for item's title text like: bottom bar, header items, ...
  ///
  /// Default: size: 13, weight: regular
  static TextStyle itemText = _defaultStyle.copyWith(fontSize: 13.sp).regular;

  /// Text use for item's title text like: bottom bar, header items, ...
  ///
  /// Default: size: 13, weight: regular
  static TextStyle headerItemText =
      _defaultStyle.copyWith(fontSize: 14.sp).bold;

  /// Text use for small text like: note, guideline text, ...
  ///
  /// Default: size: 12, weight: regular
  static TextStyle smallText = _defaultStyle.copyWith(fontSize: 12.sp).regular;

  /// Text use for caption of TextField
  ///
  /// Default: size: 10, weight: regular
  static TextStyle captionText =
      _defaultStyle.copyWith(fontSize: 10.sp).regular;

  /// Text use for caption of TextField
  ///
  /// Default: size: 10, weight: regular
  static TextStyle captionBoldText =
      _defaultStyle.copyWith(fontSize: 10.sp).bold;
}
// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);
