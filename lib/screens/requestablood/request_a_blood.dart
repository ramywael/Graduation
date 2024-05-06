import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import 'package:grad/custom_widgets/requestablood/personal_details.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;
import '../../cubits/request_a_blood/request_blood_cubit.dart';
import '../bloodreq_bloodtype_notifications_screens/blood_request.dart';

class RequestBlood extends StatefulWidget {
  const RequestBlood({Key? key}) : super(key: key);

  @override
  State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
   String bloodType = bloodGroups.first;
   UrgencyLevel? urgencyLevel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth * 0.145),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kBoxShadow,
          ),
          child: AppBar(
            leading: Icon(
              Icons.bloodtype,
              color: kPrimaryColor,
              size: screenWidth * 0.08,
              fill: 1,
            ),
            toolbarHeight: screenWidth * 0.145,
            title: CustomTextWidget(
              text: "Request Blood",
              fontSize: screenWidth * 0.06,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              screenWidth * 0.05,
            ),
            child: CustomTextWidget(
              text: "Personal Details",
              fontSize: screenWidth * 0.06,
              color: Colors.black,
              fontFamily: "Roboto",
            ),
          ),
           PersonalDetailsContainer(
            onChangedBloodType: (value) {
              setState(() {
                bloodType = value!;
              });
            },
            onChangedUrgency: (value) {
              setState(() {
                urgencyLevel = value!;
              });
            },
            selectedUrgency: urgencyLevel,
            value: bloodType,
           ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          CustomButtonConnection(
            buttonText: "Continue",
            onPressed: () {
            if(urgencyLevel!=null){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => RequestBloodCubit(),
                    child: BloodRequest(
                      bloodType: bloodType,
                      urgencyLevel: urgencyLevel!,
                    ),
                  ),
                ),
              );
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select urgency level'),
                ),
              );
            }
            },
          ),
          // CustomButton(
          //   screenHeight: screenHeight,
          //   screenWidth: screenWidth,
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const BloodRequest(),
          //       ),
          //     );
          //   },
          //   text: "Continue",
          //   color: kPrimaryColor,
          //   fontSize: screenWidth * 0.05,
          //   padding: EdgeInsets.symmetric(
          //     vertical: screenWidth * 0.02,
          //     horizontal: screenWidth * 0.05,
          //   ),
          //   margin: EdgeInsets.symmetric(
          //     horizontal: screenWidth * 0.05,
          //     vertical: screenWidth * 0.02,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: const CustomCurvedNavBar(
        screens: [
          HomePage(),
          RequestBlood(),
          HomePage(),
        ],
        icon1: MaterialSymbolsIcons.Symbols.home,
        icon2: MaterialSymbolsIcons.Symbols.bloodtype,
        icon3: MaterialSymbolsIcons.Symbols.person,
      ),
    );
  }
}
