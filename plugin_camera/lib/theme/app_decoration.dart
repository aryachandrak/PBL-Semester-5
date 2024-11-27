import 'package:flutter/material.dart';
import 'package:plugin_camera/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get linear => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            theme.colorScheme.secondaryContainer,
            theme.colorScheme.onError
          ],
        ),
      );

  static BoxDecoration get primary100 => BoxDecoration(
        color: appTheme.blue50,
      );

  static BoxDecoration get primaryse500 => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  static BoxDecoration get white => BoxDecoration(
        color: appTheme.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius get customBorderTL64 => BorderRadius.only(
        topLeft: Radius.circular(64.h),
      );

  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );

  static BorderRadius get roundedBorder50 => BorderRadius.circular(
        50.h,
      );
}
