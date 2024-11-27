part of 'create_new_password_bloc.dart';

class CreateNewPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateNewPasswordInitialEvent extends CreateNewPasswordEvent {
  @override
  List<Object?> get props => [];
}

class ChangePasswordVisibilityEvent extends CreateNewPasswordEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

class ChangePasswordVisibilityEvent1 extends CreateNewPasswordEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}
