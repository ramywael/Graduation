part of 'donate_now_cubit.dart';

@immutable
class DonateNowState {}
final class DonateNowInitial extends DonateNowState {}
final class DonateNowLoading extends DonateNowState {}
final class DonateNowSuccess extends DonateNowState {
  // final List<QuerySnapshot> bloodRequests;
  final List<RequestBloodModel> bloodRequests;
  DonateNowSuccess(this.bloodRequests);
}
final class DonateNowFailure extends DonateNowState {
  final String message;
  DonateNowFailure(this.message);
}

