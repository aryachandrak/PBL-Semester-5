import 'package:flutter/material.dart';
import 'package:plugin_camera/presentation/views/login/app_navigation_screen.dart';
import 'package:plugin_camera/presentation/views/login/splash_screen.dart';
import 'package:plugin_camera/presentation/views/login/onboarding_one_screen.dart';
import 'package:plugin_camera/presentation/views/login/onboarding_two_screen.dart';
import 'package:plugin_camera/presentation/views/login/onboarding_three_screen.dart';
import 'package:plugin_camera/presentation/views/login/onboarding_four_screen.dart';
// import 'package:plugin_camera/presentation/views/login/login_screen.dart';
// import 'package:plugin_camera/presentation/views/login/sign_up_screen.dart';
// import 'package:plugin_camera/presentation/views/login/reset_password_email_screen.dart';
// import 'package:plugin_camera/presentation/views/login/resetpassword_tab_page.dart';
// import 'package:plugin_camera/presentation/views/login/reset_password_phone_page.dart';
// import 'package:plugin_camera/presentation/views/login/reset_password_verify_code_screen.dart';
// import 'package:plugin_camera/presentation/views/login/create_new_password_screen.dart';
// import 'package:plugin_camera/presentation/views/login/tips_screen.dart';

class AppRoutes{

static const String splashScreen = '/splash_screen';
static const String onboardingOneScreen = '/onboarding_one_screen';
static const String onboardingTwoScreen = '/onboarding_two_screen'; 
static const String onboardingThreeScreen = '/onboarding_three_screen';
static const String onboardingFourScreen = '/onboarding_four_screen';
static const String loginScreen = '/login_screen';
static const String signUpScreen = '/sign_up_screen';
static const String resetPasswordEmailScreen = '/reset_password_email_screen';
static const String resetpasswordTabPage = '/resetpassword_tab_page';
static const String resetPasswordPhonePage = '/reset_password_phone_page';
static const String resetPasswordVerifyCodeScreen ='/reset_password_verify_code_screen';
static const String createNewPasswordScreen = '/create_new_password_screen';
static const String tipsScreen = '/tips_screen';
static const String appNavigationScreen = '/app_navigation_screen';
static const String initialRoute = '/initialRoute';
static Map<String, WidgetBuilder> get routes => {

splashScreen: SplashScreen.builder,

onboardingOneScreen: OnboardingOneScreen.builder, 
onboardingTwoScreen: OnboardingTwoScreen.builder, 
onboardingThreeScreen: OnboardingThreeScreen.builder,

onboardingFourScreen: OnboardingFourScreen.builder,

// loginScreen: LoginScreen.builder,

// signUpScreen: SignUpScreen.builder,

// resetPasswordEmailScreen: ResetPasswordEmailScreen.builder,

// resetPasswordVerifyCodeScreen: ResetPasswordVerifyCodeScreen.builder,

// createNewPasswordScreen: CreateNewPasswordScreen.builder,

// articlesScreen: ArticleScreen.builder,

appNavigationScreen: AppNavigationScreen.builder,

initialRoute: SplashScreen.builder
};
}