part of 'create_new_password_bloc.dart';

class CreateNewPasswordState extends Equatable {
  CreateNewPasswordState(
      {this.newpasswordController,
      this.confirmpasswordController,
      this.isShowPassword = true,
      this.isShowPassword1 = true,
      this.createNewPasswordModelobj});

  TextEditingController? newpasswordController;

  TextEditingController? confirmpasswordController;

  CreateNewPasswordModel? createNewPasswordModelobj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        newpasswordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        createNewPasswordModelobj
      ];

  CreateNewPasswordState copywith({
    TextEditingController? newpasswordController,
    TextEditingController? confirmpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    CreateNewPasswordModel? createNewPasswordModelobj,
  }) {
    return CreateNewPasswordState(
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      createNewPasswordModelobj:
          createNewPasswordModelobj ?? this.createNewPasswordModelobj,
    );
  }
}
