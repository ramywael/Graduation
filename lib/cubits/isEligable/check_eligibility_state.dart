part of 'check_eligibility_cubit.dart';

@immutable
abstract class CheckEligibilityState {}

class CheckEligibilityInitial extends CheckEligibilityState {}
class CheckEligibilitySuccess extends CheckEligibilityState {}
class CheckEligibilityFailure extends CheckEligibilityState {}
class CheckEligibilityInProgress extends CheckEligibilityState {}


