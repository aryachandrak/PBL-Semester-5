part of 'onboarding_one_bloc.dart';

class OnboardingOneState extends Equatable {
  OnboardingOneState({this.onboardingOneModelObj});

  OnboardingOneModel? onboardingOneModelObj;

  @override
  List<Object?> get props => [onboardingOneModelObj];
  OnboardingOneState copyWith({OnboardingOneModel? onboardingOneModelObj}) {
    return OnboardingOneState(
      onboardingOneModelObj: 
      onboardingOneModelObj ?? this.onboardingOneModelObj,
    );
  }
}