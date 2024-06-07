import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import 'package:grad/screens/home/body_home_screen.dart';

import '../../services/notification_service.dart';

class HomePage extends StatefulWidget {
  final bool isDonated;
  const HomePage({super.key, this.isDonated = false});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    NotificationService.getFirebaseMessagingToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:BodyHomeScreen(),
    );
  }
}
