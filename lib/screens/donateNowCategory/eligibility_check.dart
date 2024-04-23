import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/contents/donatenow/eligability_check_model.dart';
import 'package:grad/screens/donateNowCategory/donate.dart';
import 'package:grad/screens/home/user_home_page.dart';

class EligibilityCheck extends StatefulWidget {
  const EligibilityCheck({Key? key}) : super(key: key);

  @override
  State<EligibilityCheck> createState() => _EligibilityCheckState();
}

class _EligibilityCheckState extends State<EligibilityCheck> {
  List<String> userAnswers = [];
  bool isEligible = true;
  int currentQuestionIndex = 0;

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
            Text(
              questionsModel[currentQuestionIndex]["question"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getFontSize(context),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      userAnswers.add("yes");
                      isEligible = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text(
                            "Sorry, you are not eligible to donate",
                          ),
                        ),
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(isDonated: isEligible),
                      ));
                    });
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
                          fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      userAnswers.add("no");
                      currentQuestionIndex++;
                      if (currentQuestionIndex == questionsModel.length - 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: kSecondaryColor,
                            content: Text(
                              "You are eligible to donate",
                            ),
                          ),
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DonateNow(),
                        ));
                      }
                    });
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
                      child:  Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
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