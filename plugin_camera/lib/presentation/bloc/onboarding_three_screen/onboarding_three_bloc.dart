import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../models/onboarding_three_model.dart';
part 'onboarding_three_event.dart';
part 'onboarding_three_state.dart';

class OnboardingThreeBloc
    extends Bloc<OnboardingThreeEvent, OnboardingThreeState> {
  OnboardingThreeBloc(super.initialState) {
    on<OnboardingThreeInitialEvent>(_onInitialize);
  }
  _onInitialize(
    OnboardingThreeInitialEvent event,
    Emitter<OnboardingThreeState> emit,
  ) async {}
}
