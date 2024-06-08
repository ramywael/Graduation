import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/find_blood_donor/find_blood_donor_cubit.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/chatbot/chat_definition.dart';
import 'package:grad/screens/chatbot/dead_chatbot_files/chatbot.dart';
import 'package:grad/screens/findBloodDonor/choose_donor.dart';
import 'package:grad/screens/home/row_categories_home_screen.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;
import '../anime_predict_ai/anime_detection.dart';
import '../profile_and_rate_screens/profile.dart';

class ContainerHomeScreen extends StatelessWidget {

  const ContainerHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                screenWidth * 0.03), // Adjusted based on screen width
            topRight: Radius.circular(
                screenWidth * 0.03), // Adjusted based on screen width
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.02, // Adjusted based on screen height
                left: screenWidth * 0.05, // Adjusted based on screen width
                right: screenWidth * 0.05, // Adjusted based on screen width
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      screenWidth * 0.01), // Adjusted based on screen width
                  border: Border.all(
                    color: kPrimaryColor,
                    width:
                        screenWidth * 0.004, // Adjusted based on screen width
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        screenHeight * 0.005, // Adjusted based on screen height
                    horizontal:
                        screenWidth * 0.02, // Adjusted based on screen width
                  ),
                  child: CustomTextWidget(
                    text: "Be Today's Hero",
                    fontSize:
                        screenWidth * 0.065, // Adjusted based on screen width
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
            ),
            const RowCategoriesHomeScreen(),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.only(
                     bottom: screenHeight * 0.09, // Adjusted based on screen height
                     left: screenWidth * 0.045, // Adjusted based on screen width
                     right: screenWidth * 0.012, // Adjusted based on screen width
                   // ),
           ),
                   child: CustomCategoryHomeScreen(
                     text: "Blood Donor",
                     icon: MaterialSymbolsIcons.Symbols.local_hospital,
                     onTap: () {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => BlocProvider(
                               create: (BuildContext context) {
                                 return FindBloodDonorCubit();
                               },
                               child: const ChooseDonor()),
                         ),
                       );
                     },
                   ),
                 ),
               ),
               SizedBox(
                  width: screenWidth * 0.02, // Adjusted based on screen width
                ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.only(
                     bottom: screenHeight * 0.09, // Adjusted based on screen height
                     left: screenWidth * 0.015, // Adjusted based on screen width
                     right: screenWidth * 0.048, // Adjusted based on screen width
                   ),
                   child: CustomCategoryHomeScreen(
                     text: "Am I Animatic?",
                     icon: MaterialSymbolsIcons.Symbols.blood_pressure_sharp,
                     onTap: () {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => const AnemiaPredictionForm(),
                         ),
                       );
                     },
                   ),
                 ),
               ),
             ],
           ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.045, // Adjusted based on screen height
                ),
                child: const CustomCurvedNavBar(
                  screens: [
                    ChatbotHomeView(),
                    HomePage(),
                    ProfileView(),
                  ],
                  icon1: MaterialSymbolsIcons.Symbols.android,
                  icon2: MaterialSymbolsIcons.Symbols.home,
                  icon3: MaterialSymbolsIcons.Symbols.person,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
