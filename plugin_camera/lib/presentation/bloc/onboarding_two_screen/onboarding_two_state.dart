part of 'onboarding_two_bloc.dart';

class OnboardingTwoState extends Equatable {
  OnboardingTwoState({this.onboardingTwoModelObj});
  OnboardingTwoModel? onboardingTwoModelObj;

  @override
  List<Object?> get props => [onboardingTwoModelObj];
  OnboardingTwoState copyWith({OnboardingTwoModel? onboardingTwoModelObj}) {
    return OnboardingTwoState(
      onboardingTwoModelObj:
          onboardingTwoModelObj ?? this.onboardingTwoModelObj,
    );
  }
}
