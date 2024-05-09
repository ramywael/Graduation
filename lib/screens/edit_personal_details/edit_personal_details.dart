import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/edit_personal_details/field_with_its_text.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/profile.dart';
import 'package:grad/screens/home/user_home_page.dart';

class EditPersonalDetails extends StatelessWidget {
  EditPersonalDetails({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailAddress = TextEditingController();
  final homeAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.012),
          decoration: BoxDecoration(boxShadow: kBoxShadow),
          child: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(
              'Blood Donation App',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: screenWidth * 0.075,
                  fontWeight: FontWeight.w900,
                  wordSpacing: -3),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: screenHeight * 0.02),
                child: Icon(
                  Icons.save,
                  color: kPrimaryColor,
                  size: screenWidth * 0.07,
                ),
              ),
            ],
            centerTitle: true,
            scrolledUnderElevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.075,
                            fontFamily: 'Roboto'
                        ),
                  ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      FieldAndItsText(
                        screenWidth: screenWidth,
                        controller: nameController,
                        type: TextInputType.name,
                        hintText: 'Enter your name',
                        text: 'Name',
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      FieldAndItsText(
                        screenWidth: screenWidth,
                        controller: phoneController,
                        type: TextInputType.phone,
                        hintText: 'Enter your contact number',
                        text: 'Contact Number',
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      FieldAndItsText(
                        screenWidth: screenWidth,
                        controller: emailAddress,
                        type: TextInputType.emailAddress,
                        hintText: 'Enter your email address',
                        text: 'Email Address',
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      FieldAndItsText(
                        screenWidth: screenWidth,
                        controller: homeAddress,
                        type: TextInputType.streetAddress,
                        hintText: 'Enter your home address',
                        text: 'Home Address',
                      ),
                      SizedBox(
                        height: screenHeight * 0.045,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  height: screenHeight * 0.1,
                  child: CustomButton(
                    text: 'Save Changes',
                    onTap: () {},
                    color: kPrimaryColor,
                    fontSize: 18,
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                  ),
                )
              ],
            ),
          ),
      ),
      bottomNavigationBar: CustomCurvedNavBar(
        icon1: Icons.home,
        icon2: Icons.settings,
        icon3: Icons.person,
        screens: [
          const HomePage(),
          EditPersonalDetails(),
          const ProfileView(),
        ],),
    );
  }
}
