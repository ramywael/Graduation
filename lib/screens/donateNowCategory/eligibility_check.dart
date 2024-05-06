import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/contents/donatenow/eligability_check_model.dart';
import 'package:grad/cubits/isEligable/check_eligibility_cubit.dart';

import '../../cubits/profile/get_current_user_cubit.dart';

class EligibilityCheck extends StatelessWidget {
  const EligibilityCheck({
    Key? key,
  }) : super(key: key);

  double getFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return 24.0;
    } else {
      return 18.0;
    }
  }

  double getPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return 100.0;
    } else {
      return 50.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eligibility Check",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CheckEligibilityCubit, CheckEligibilityState>(
              builder: (context, state) {
                int currentQuestionIndex =
                    BlocProvider.of<CheckEligibilityCubit>(context)
                        .currentQuestionIndex;
                return Text(
                  questionsModel[currentQuestionIndex]["question"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFontSize(context),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CheckEligibilityCubit>(context)
                        .answerWithYes(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.013,
                        horizontal: getPadding(context),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              MediaQuery.of(context).size.width > 600 ? 20 : 16,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CheckEligibilityCubit>(context)
                        .answerWithNo(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.013,
                        horizontal: getPadding(context),
                      ),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              MediaQuery.of(context).size.width > 600 ? 20 : 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
