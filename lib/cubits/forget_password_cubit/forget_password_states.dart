abstract class ForgetPasswordStates{}

class ForgetPasswordInitialState extends ForgetPasswordStates{}

class CreatingNewPasswordLoading extends ForgetPasswordStates {}

class EnterNewPasswordSuccess extends ForgetPasswordStates {}

class ReEnterNewPasswordSuccess extends ForgetPasswordStates {}

class CreatingNewPasswordFailure extends ForgetPasswordStates {
  final String creationFailed ;
  CreatingNewPasswordFailure(this.creationFailed);
}