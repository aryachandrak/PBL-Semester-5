import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/app_export.dart';
import 'package:flutter/services.dart';

// ignore_for_file: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField(
      {super.key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.validator});

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget)
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 4,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? theme.textTheme.headlineSmall,
        hintStyle: hintStyle ?? theme.textTheme.headlineSmall,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 64.h,
          fieldWidth: 64.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(16.h),
          inactiveColor: appTheme.gray500,
          activeColor: theme.colorScheme.primary,
          activeFillColor: appTheme.whiteA700,
          inactiveFillColor: appTheme.whiteA700,
          selectedFillColor: appTheme.whiteA700,
          selectedColor: theme.colorScheme.primary,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
