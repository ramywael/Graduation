import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/thanks_screens.dart';



class ThanksForSavingLife extends StatelessWidget {
  const ThanksForSavingLife({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThanksScreen(
        image: 'assets/images/Image.png',
        firstTextImage: 'assets/images/savinglife.png',
        secondTextImage: 'assets/images/donationsubmission.png'
    );
  }
}
