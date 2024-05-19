part of 'select_time_request_cubit.dart';

@immutable
class SelectTimeRequestState {}

final class SelectTimeRequestInitial extends SelectTimeRequestState {}
final class SelectTimeRequestSuccess extends SelectTimeRequestState {}
final class SelectTimeRequestFailure extends SelectTimeRequestState {
  final String message;
  SelectTimeRequestFailure(this.message);
}
final class SelectTimeRequestLoading extends SelectTimeRequestState {}

