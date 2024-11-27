import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../bloc/onboarding_three_screen/onboarding_three_bloc.dart';
import '../../models/onboarding_three_model.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingThreeBloc>(
      create: (context) => OnboardingThreeBloc(OnboardingThreeState(
        onboardingThreeModelObj: OnboardingThreeModel(),
      ))
        ..add(OnboardingThreeInitialEvent()),
      child: const OnboardingThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingThreeBloc, OnboardingThreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: double.maxFinite,
              height: SizeUtils.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: const Alignment(0.5, 0),
                    end: const Alignment(0.5, 1),
                    colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.onError
                    ]),
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 768.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 20.h,
                                      top: 46.h,
                                      right: 14.h,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.h),
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.treatment,
                                          height: 464.h,
                                          width: 320.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        _buildContentSection(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 30.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadiusStyle.customBorderTL64,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 4.h),
            padding: EdgeInsets.symmetric(horizontal: 22.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 244.h,
                    child: Text(
                      "msg_get_connect_our",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 8.h,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      spacing: 4,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: appTheme.blue50,
                      dotHeight: 8.h,
                      dotWidth: 8.h,
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                CustomElevatedButton(
                  text: "get_started",
                  margin: EdgeInsets.only(right: 2.h),
                  onPressed: () {
                    onTapGetstarted(context);
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 4.h)
        ],
      ),
    );
  }

  onTapGetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingFourScreen,
    );
  }
}
