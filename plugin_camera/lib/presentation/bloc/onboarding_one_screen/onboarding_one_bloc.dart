import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'package:plugin_camera/presentation/models/onboarding_one_model.dart';
part 'onboarding_one_event.dart';
part 'onboarding_one_state.dart';

class OnboardingOneBloc extends Bloc<OnboardingOneEvent, OnboardingOneState> {
  OnboardingOneBloc(super.initialstate) {
    on<OnboardingOneInitialEvent>(_onInitialize);
  }
  _onInitialize(
    OnboardingOneInitialEvent event,
    Emitter<OnboardingOneState> emit,
  ) async {}
}
