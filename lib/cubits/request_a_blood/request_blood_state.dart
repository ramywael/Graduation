part of 'request_blood_cubit.dart';

@immutable
abstract class RequestBloodState {}

class RequestBloodInitial extends RequestBloodState {}
class RequestBloodLoading extends RequestBloodState {}
class RequestBloodSuccess extends RequestBloodState {}
class RequestBloodFailure extends RequestBloodState {}
