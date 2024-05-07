import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_by_blood_group_state.dart';

class SearchByBloodGroupCubit extends Cubit<SearchByBloodGroupState> {
  SearchByBloodGroupCubit() : super(SearchByBloodGroupInitial());
}
