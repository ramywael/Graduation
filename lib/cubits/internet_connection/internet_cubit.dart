import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {

  InternetCubit() : super(InternetInitial());
  hasConnection(context) async{
    emit(InternetLoading());
    bool isOnline=await InternetConnectionChecker().hasConnection;
    if(isOnline==false){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No Internet Connection"),
          backgroundColor: Colors.yellow,
        ),
      );
    }
    emit(InternetInitial());
  }
}
