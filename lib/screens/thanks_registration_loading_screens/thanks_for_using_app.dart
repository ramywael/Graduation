import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/thanks_screens.dart';

class ThanksForUsingApp extends StatelessWidget {
  const ThanksForUsingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThanksScreen(
        image: 'assets/images/img.png',
        firstTextImage: 'assets/images/usingapp.png',
        secondTextImage: 'assets/images/requestsubmission.png'
    );
  }
}
