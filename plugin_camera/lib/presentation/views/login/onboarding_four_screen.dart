import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_outline_button.dart';
import '../../bloc/onboarding_four_screen/onboarding_four_bloc.dart';
import '../../models/onboarding_four_model.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingFourBloc>(
      create: (context) => OnboardingFourBloc(OnboardingFourState(
        onboardingFourModelObj: OnboardingFourModel(),
      ))
        ..add(OnboardingFourInitialEvent()),
      child: OnboardingFourScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingFourBloc, OnboardingFourState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 176.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildThumbsUpSection(context)],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: _buildLoginButtonsSection(context),
          ),
        );
      },
    );
  }

  Widget _buildThumbsUpSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 44.h),
      child: Column(
        children: [
          SizedBox(
            width: 88.h,
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.logo,
                  height: 66.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 14.h),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Glowbies",
                  style: CustomTextStyles.headlineSmallPrimary,
                )
              ],
            ),
          ),
          SizedBox(height: 38.h),
          Text(
            "Let's get started!",
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 6.h),
          Text(
            "Login to enjoy the features we've provided, and stay glow",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumGray600.copyWith(
              height: 1.50,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginButtonsSection(BuildContext context) {
    return Container(
      height: 128.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 20.h,
        right: 14.h,
        bottom: 60.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomElevatedButton(
            text: "lbl_login",
            margin: EdgeInsets.only(right: 4.h),
            onPressed: () {
// onTapLogin(context);
            },
          ),
          SizedBox(height: 16.h),
          CustomOutlinedButton(
            text: "lbl_sign_up",
            margin: EdgeInsets.only(right: 4.h),
            buttonStyle: CustomButtonStyles.outlinePrimary,
            buttonTextStyle: CustomTextStyles.titleMediumPrimary,
            onPressed: () {
// onTapSignup (context);
            },
          )
        ],
      ),
    );
  }

  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapSignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
