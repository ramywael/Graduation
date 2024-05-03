import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/blood_request_screen/time_blood_request_container.dart';
import 'package:grad/custom_widgets/blood_request_screen/urgent_blood_request_container.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_using_app.dart';
import 'attached_blood_request_container.dart';

class BloodRequestContent extends StatefulWidget {
  const BloodRequestContent({super.key});

  @override
  State<BloodRequestContent> createState() => _BloodRequestContentState();
}

class _BloodRequestContentState extends State<BloodRequestContent> {
  int bloodBracketsCount = 0;
   DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood Brackets',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        UrgentRequestsBloodRequestContainer(
          bloodBracketCount: bloodBracketsCount,
          onDecrement: () {
            if (bloodBracketsCount > 0) {
              setState(() {
                bloodBracketsCount--;
              });
            }
          },
          screenWidth: screenWidth,
          onIncrement: () {
            setState(() {
              bloodBracketsCount++;
            });
          },
        ),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Attached',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        AttachedBloodRequestContainer(screenWidth: screenWidth),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        TimeBloodRequestContainer(
          selectedDate: selectedDate,
          screenWidth: screenWidth,
          onDateChanged: () async {
            DateTime? newDate = await showDatePicker(
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(primary: kPrimaryColor),
                    buttonTheme: const ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                  child: child!,
                );
              },
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 0)),
              lastDate: selectedDate.add(const Duration(days: 365)),
            );
            if(newDate==null) return;
            setState(() {
              selectedDate=newDate;
            });
          },
        ),
        SizedBox(height: screenWidth * 0.07),
        Center(
          child: Container(
              width: screenWidth * 0.4,
              height: screenWidth * 0.13,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(45),
              ),
              child: CustomButtonConnection(
                buttonText: "Submit",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThanksForUsingApp(),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
