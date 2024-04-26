
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleObserver implements BlocObserver
{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    debugPrint("Change $change");
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint("Close = $bloc");
    // it is called when the bloc is closed

  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint("Create = $bloc");
    // it is called when the bloc is created
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }

}
