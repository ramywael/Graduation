import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/cubits/log_in_cubit/login_cubit.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import 'package:grad/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'observer/observer.dart';

void main() async {
  Bloc.observer = SimpleObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocProvider(
          create: (BuildContext context) {
            return GetCurrentUserCubit();
          },
          child: const DonationBlood())));
}
