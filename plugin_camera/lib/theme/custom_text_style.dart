import 'package:flutter/material.dart';
import 'package:plugin_camera/core/app_export.dart';

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}

class CustomTextStyles {
// Body text style
  static TextStyle get bodyLargeBluegray400 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static TextStyle get bodyMediumGray600 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );

  static TextStyle get bodyMediumSFProDisplayErrorContainer =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: theme.colorScheme.errorContainer,
      );

// Headline text style
  static TextStyle get headlineSmallPrimary =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 25.fSize,
      );
  static TextStyle get headlineSmallSemiBold =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static TextStyle get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );

  static TextStyle get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMediumGray500 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumGray500Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumGray600 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumMedium =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumMedium16 =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static TextStyle get titleMediumWhiteA700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
      );

  static TextStyle get titleSmallBluegray400 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray400,
      );
  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmallPrimary_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
}
