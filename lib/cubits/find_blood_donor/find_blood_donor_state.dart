part of 'find_blood_donor_cubit.dart';

@immutable
abstract class FindBloodDonorState {}

class FindBloodDonorInitial extends FindBloodDonorState {}
class FindBloodDonorLoading extends FindBloodDonorState {}
class FindBloodDonorSuccess extends FindBloodDonorState {}
class FindBloodDonorFailure extends FindBloodDonorState {}

