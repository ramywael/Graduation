part of 'get_current_user_cubit.dart';

@immutable
abstract class GetCurrentUserState {}

class GetCurrentUserInitial extends GetCurrentUserState {}
class GetCurrentUserLoading extends GetCurrentUserState {}
class GetCurrentUserSuccess extends GetCurrentUserState {
  GetCurrentUserSuccess(this.userData);
 final DocumentSnapshot userData;
}
class GetCurrentUserFailure extends GetCurrentUserState {}

