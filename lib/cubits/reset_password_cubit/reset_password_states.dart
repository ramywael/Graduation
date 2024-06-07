abstract class ResetPassStates {}

class ResetPassInitialState extends ResetPassStates{}

class ResetPassLoading extends ResetPassStates {}

class ResetPassSuccess extends ResetPassStates{}

class ResetPassFailure extends ResetPassStates{
  final String errorMessage;
  ResetPassFailure(this.errorMessage);
}
