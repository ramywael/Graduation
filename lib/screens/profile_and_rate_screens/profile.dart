import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/screens/chatbot/chat_definition.dart';
import 'package:grad/screens/edit_personal_details/edit_personal_details.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../constants/constant.dart';
import '../../cubits/profile/get_current_user_cubit.dart';
import '../../custom_widgets/profile_components/container_items_and_buttons.dart';
import '../../custom_widgets/profile_components/row_of_user_data.dart';
import '../bloodreq_bloodtype_notifications_screens/notifications.dart';
import '../chatbot/chatbot.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // @override
  // void initState() {
  //   BlocProvider.of<GetCurrentUserCubit>(context).getCurrentUser();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
      ),
      // body: BlocBuilder<GetCurrentUserCubit,GetCurrentUserState>(
      //   builder: (context, state) {
      //     if (state is GetCurrentUserLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     else if (state is GetCurrentUserSuccess) {
      //       final snapShot = state.userData;
      //       return  Padding(
      //         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Center(
      //               child: SizedBox(
      //                 height: screenWidth * 0.3,
      //                 width: screenWidth * 0.3,
      //               ),
      //             ),
      //             SizedBox(
      //               height: screenWidth * 0.06,
      //             ),
      //             Text(
      //               snapShot["Name"],
      //               style: TextStyle(
      //                 fontSize: screenWidth * 0.07,
      //                 fontFamily: 'Pacifico',
      //                 color: const Color(0xffc2c2c2),
      //               ),
      //             ),
      //             SizedBox(
      //               height: screenWidth * 0.06,
      //             ),
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const RowOfUserData(
      //                   icon: Icons.bloodtype_sharp,
      //                   text: 'Blood Type:  ',
      //                 ),
      //                 Text(
      //                   snapShot["BloodType"],
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: screenWidth * 0.045,
      //                     fontFamily: 'Roboto',
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: screenWidth * 0.06,
      //                 ),
      //                 RowOfUserData(
      //                   icon: Icons.edit_location_alt,
      //                   text: snapShot["location"],
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: screenWidth * 0.04,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 RowOfUserData(
      //                   icon: Icons.add_call,
      //                   text: snapShot["PhotoUrl"],
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: screenWidth * 0.05,
      //             ),
      //             Expanded(
      //               child: Padding(
      //                 padding: EdgeInsets.only(
      //                   bottom: screenWidth * 0.15,
      //                 ),
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(screenWidth * 0.055),
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       ItemsAndButtons(
      //                         text: 'Bonus',
      //                         textNum: '+100',
      //                         buttonText: 'Settings',
      //                         function: () {
      //                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //                             return EditPersonalDetails(
      //                               oldName: snapShot["Name"],
      //                               oldPhone: snapShot["PhotoUrl"],
      //                               oldEmail: snapShot["Email"],
      //                               oldHome: snapShot["location"],
      //                             );
      //                           }));
      //                         },
      //                       ),
      //                       ItemsAndButtons(
      //                         text: 'Treatments',
      //                         textNum: '1',
      //                         buttonText: 'Notification',
      //                         function: () {
      //
      //                         },
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       );
      //     }
      //     else {
      //       return const Center(
      //         child: Text('Error'),
      //       );
      //     }
      //   },
      //
      // ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection(kUserCollectionName).doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError){
            return const Center(
              child: Text('Error'),
            );
          }
          else  {

            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: screenWidth * 0.3,
                      width: screenWidth * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.06,
                  ),
                  Text(
                    snapshot.data!['Name'],
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
                        snapshot.data!['BloodType'],
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
                        text: snapshot.data!['location'],
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
                        text: snapshot.data!['PhotoUrl'],
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
                              text: 'Bonus',
                              textNum: '+100',
                              buttonText: 'Settings',
                              function: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return EditPersonalDetails(
                                    oldName: snapshot.data!['Name'],
                                    oldPhone: snapshot.data!['PhotoUrl'],
                                    oldEmail: snapshot.data!['Email'],
                                    oldHome: snapshot.data!['location'],
                                  );
                                }));
                              },
                            ),
                            ItemsAndButtons(
                              text: 'Treatments',
                              textNum: '1',
                              buttonText: 'Notification',
                              function: () {

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
          }

        },
      ),
      bottomNavigationBar: const CustomCurvedNavBar(
        icon1: Icons.chat,
        icon2: Icons.person,
        icon3: Icons.home,
        screens: [
          ChatbotHomeView(),
          ProfileView(),
          HomePage()
        ],
      ),
    );
  }
}
