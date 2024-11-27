import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../models/onboarding_two_model.dart';
part 'onboarding_two_event.dart';
part 'onboarding_two_state.dart';

class OnboardingTwoBloc extends Bloc<OnboardingTwoEvent, OnboardingTwoState> {
  OnboardingTwoBloc(super.initialState) {
    on<OnboardingTwoInitialEvent>(_onInitialize);
  }
  _onInitialize(
    OnboardingTwoInitialEvent event,
    Emitter<OnboardingTwoState> emit,
  ) async {}
}
