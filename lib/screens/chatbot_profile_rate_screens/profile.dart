import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/chatbot_profile_rate_screens/chatbot.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../constants/constant.dart';
import '../../cubits/profile/get_current_user_cubit.dart';
import '../../custom_widgets/profile_components/container_items_and_buttons.dart';
import '../../custom_widgets/profile_components/row_of_user_data.dart';
import '../bloodreq_bloodtype_notifications_screens/notifications.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    BlocProvider.of<GetCurrentUserCubit>(context).getCurrentUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff81201a),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<GetCurrentUserCubit,GetCurrentUserState>(
        builder: (context, state) {
          if (state is GetCurrentUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCurrentUserSuccess) {
            final snapShot = state.userData;
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: screenWidth * 0.3,
                      width: screenWidth * 0.3,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profile_image.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.06,
                  ),
                  Text(
                    snapShot["Name"],
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontFamily: 'Pacifico',
                      color: const Color(0xffc2c2c2),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.06,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const RowOfUserData(
                        icon: Icons.bloodtype_sharp,
                        text: 'Blood Type:  ',
                      ),
                      Text(
                        snapShot["BloodType"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.06,
                      ),
                      RowOfUserData(
                        icon: Icons.edit_location_alt,
                        text: snapShot["location"],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidth * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RowOfUserData(
                        icon: Icons.add_call,
                        text: snapShot["PhotoUrl"],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidth * 0.05,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: screenWidth * 0.15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.055),
                        ),
                        child: Row(
                          children: [
                            ItemsAndButtons(
                              text: 'Live Impacted',
                              textNum: '34',
                              buttonText: 'Settings',
                              function: () {},
                            ),
                            ItemsAndButtons(
                              text: 'Treatments',
                              textNum: '4',
                              buttonText: 'Notification',
                              function: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Notifications(),
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },

      ),
      bottomNavigationBar: const CustomCurvedNavBar(
        icon1: Icons.chat,
        icon2: Icons.person,
        icon3: Icons.home,
        screens: [
          Chatbot(
            screenName: ProfileView(),
          ),
          ProfileView(),
          HomePage()
        ],
      ),
    );
  }
}
