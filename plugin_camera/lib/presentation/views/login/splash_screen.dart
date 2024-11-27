import 'package:flutter/material.dart';
import 'package:plugin_camera/presentation/views/login/onboarding_one_screen.dart';
// import 'package:plugin_camera/presentation/views/login/app_navigation_screen.dart';
// import 'package:plugin_camera/presentation/views/login/onboarding_one_screen.dart';
import '../../../core/app_export.dart';
import 'package:plugin_camera/presentation/bloc/splash_screen/splash_bloc.dart';
import 'package:plugin_camera/presentation/models/splash_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(SplashState(
        splashModelObj: const SplashModel(),
      ))
        ..add(SplashInitialEvent()),
        child: const SplashScreen(),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Navigasi otomatis setelah splash screen
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingOneScreen.builder(context),
        ),
      );
    });
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: Container(
              width: double.maxFinite,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     // colors: [Color(0XFF227DDE), Colors.white],
              //     // colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 0, 255, 238),], // Gradien biru elektrik ke putih
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //   ),
              // ),
              padding: EdgeInsets.all(14.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogoSection(context),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildLogoSection(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 4.h),
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.logo,
            height: 170.h,
            width: 170.h,
          ),
          SizedBox(height: 10.h),
          Text(
            "Glowbies",
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }

  static void _goToOnboarding(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingOneScreen,
    );
  }
}
