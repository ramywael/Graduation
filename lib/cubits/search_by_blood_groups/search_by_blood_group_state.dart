part of 'search_by_blood_group_cubit.dart';

@immutable
abstract class SearchByBloodGroupState {}

class SearchByBloodGroupInitial extends SearchByBloodGroupState {}
class SearchByBloodGroupSuccess extends SearchByBloodGroupState {}
class SearchByBloodGroupLoading extends SearchByBloodGroupState {}
class SearchByBloodGroupFailure extends SearchByBloodGroupState {}


