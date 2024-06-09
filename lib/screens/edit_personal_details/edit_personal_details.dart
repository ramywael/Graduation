
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/edit_personal_details_cubit/edit_data_cubit.dart';
import 'package:grad/cubits/edit_personal_details_cubit/edit_data_states.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/edit_personal_details/field_with_its_text.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/screens/edit_personal_details/screen_arguments.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../profile_and_rate_screens/profile.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({super.key, required this.oldName, required this.oldPhone, required this.oldEmail, required this.oldHome});

  final String oldName;
  final String oldPhone;
  final String oldEmail;
  final String oldHome;


  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {


  @override
  void initState() {
    super.initState();
    // EditDataCubit.get(context).nameController.text = widget.oldName;
    // EditDataCubit.get(context).phoneController.text = widget.oldPhone;
    // EditDataCubit.get(context).emailAddress.text = widget.oldEmail;
    // EditDataCubit.get(context).homeAddress.text = widget.oldHome;
    FirebaseFirestore.instance.collection(kUserCollectionName).where('id',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>EditDataCubit(),
      child: BlocConsumer<EditDataCubit,EditDataStates>(
        listener: (context,state){},
        builder: (context,state){
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;
          var cubit = EditDataCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: Container(
                margin: EdgeInsets.only(top: screenHeight * 0.012),
                decoration: BoxDecoration(boxShadow: kBoxShadow),
                child: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context)=>const ProfileView()),
                              (route) => false);
                    },
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
                child: Form(
                  key: cubit.formKey,
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
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                            FieldAndItsText(
                              screenWidth: screenWidth,
                              controller: cubit.nameController,
                              type: TextInputType.name,
                              hintText: 'Enter the new name',
                              text: 'Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter a new name please";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                cubit.nameController.text = value!;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            FieldAndItsText(
                              screenWidth: screenWidth,
                              controller: cubit.phoneController,
                              type: TextInputType.phone,
                              hintText: 'Enter your new contact number',
                              text: 'Contact Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter a new number please";
                                } else if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
                                  return "Number must start with '01' and be 11 digits long";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                cubit.phoneController.text = value!;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            FieldAndItsText(
                              screenWidth: screenWidth,
                              controller: cubit.emailAddress,
                              type: TextInputType.emailAddress,
                              hintText: 'Enter your new email address',
                              text: 'Email Address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter a new email please";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                cubit.emailAddress.text = value!;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            FieldAndItsText(
                              screenWidth: screenWidth,
                              controller: cubit.homeAddress,
                              type: TextInputType.streetAddress,
                              hintText: 'Enter your new home address',
                              text: 'Home Address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter a new home address please";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                cubit.homeAddress.text = value!;
                              },
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
                          onTap: () async{
                            if (cubit.formKey.currentState!.validate()){
                              cubit.formKey.currentState!.save();
                              cubit.updateData();
                              await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=>const ProfileView()),
                                      (route)=> false
                              );
                            }
                            // cubit.signOut(context);
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(builder: (context)=>const ProfileView()),
                            //         (route) => false);
                          },
                          color: kPrimaryColor,
                          fontSize: 18,
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar:  CustomCurvedNavBar(
              icon1: Icons.home,
              icon2: Icons.settings,
              icon3: Icons.person,
              screens: [
                const HomePage(),
                EditPersonalDetails(oldName: cubit.nameController.text, oldPhone: cubit.phoneController.text, oldEmail: cubit.emailAddress.text, oldHome:cubit.homeAddress.text,),
                const ProfileView(),
              ],
            ),
          );
        },
      ),
    );
  }


}

