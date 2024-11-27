import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
// import '../sign_up_success_dialog/sign_up_success_dialog.dart';
import 'package:plugin_camera/presentation/bloc/app_navigation_screen/app_navigation_bloc.dart';
import 'package:plugin_camera/presentation/models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: const AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: const AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0XFFFFFFFF),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize: 20.fSize,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "Check your app's UI from the below demo screens of your app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0XFF888888),
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: const Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash Screen",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),

                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding One",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingOneScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding Two",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingTwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding Three",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingThreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding Four",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.onboardingFourScreen),
                            ),

                            _buildScreenTitle(
                              context,
                              screenTitle: "Login",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginScreen),
                            ),
// _buildScreenTitle(
// context,
// screenTitle: "Sign Up",
// ),
// onTapScreenTitle:
// () =>
// onTapScreenTitle(AppRoutes.SignUpScreen),),

// _buildScreenTitle(
// ),
// context,
// screenTitle: "Sign Up - Success - Dialog", onTapScreenTitle: () => onTapDialogTitle(context, ││SignUpSuccessDialog.builder(context)),
// _buildScreenTitle(
// ),
// context,
// screenTitle: "Reset Password - Email", onTapScreenTitle: () => onTapScreenTitle( AppRoutes.resetPasswordEmailScreen),
// _buildScreenTitle(
// ),
// context,
// screenTitle: "Reset Password - Verify Code", onTapScreenTitle: () => onTapScreenTitle( AppRoutes.resetPasswordVerifyCodeScreen),
// _buildScreenTitle(
// );
// context,
// screenTitle: "Create New Password", onTapScreenTitle: () => onTapScreenTitle( AppRoutes.createNewPasswordScreen),
// _buildScreenTitle(
// context,
// screenTitle: "Articles",
// onTapScreenTitle: () =>
// onTapScreenTitle(AppRoutes.articlesScreen),
// )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

/////////
  ///

  void onTapDialogTitle(
    BuildContext context,
    Widget className,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: className,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }

  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: const Color(0xFF888888),
            )
          ],
        ),
      ),
    );
  }

  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
