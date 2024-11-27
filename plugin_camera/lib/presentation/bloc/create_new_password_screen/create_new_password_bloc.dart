import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:plugin_camera/core/app_export.dart';
import 'package:plugin_camera/presentation/models/create_new_password_model.dart';
part 'create_new_password_event.dart';
part 'create_new_password_state.dart';

class CreateNewPasswordBloc
    extends Bloc<CreateNewPasswordEvent, CreateNewPasswordState> {
  CreateNewPasswordBloc(super.initialstate) {
    on<CreateNewPasswordInitialEvent>(_onInitialize);

    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
  }

  _onInitialize(
    CreateNewPasswordInitialEvent event,
    Emitter<CreateNewPasswordState> emit,
  ) async {
    emit(
      state.copywith(
        newpasswordController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
      ),
    );
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<CreateNewPasswordState> emit,
  ) {
    emit(state.copywith(
      isShowPassword: event.value,
    ));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<CreateNewPasswordState> emit,
  ) {
    emit(state.copywith(
      isShowPassword1: event.value,
    ));
  }
}
