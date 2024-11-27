part of 'onboarding_four_bloc.dart';

class OnboardingFourState extends Equatable {
  OnboardingFourState({this.onboardingFourModelObj});

  OnboardingFourModel? onboardingFourModelObj;

  @override
  List<Object?> get props => [onboardingFourModelObj];
  OnboardingFourState copyWith({OnboardingFourModel? onboardingFourModelObj}) {
    return OnboardingFourState(
      onboardingFourModelObj:
          onboardingFourModelObj ?? this.onboardingFourModelObj,
    );
  }
}
