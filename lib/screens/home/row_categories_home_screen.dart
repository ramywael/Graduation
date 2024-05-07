import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/screens/donateNowCategory/donate.dart';
import 'package:grad/screens/donateNowCategory/eligibility_check.dart';
import 'package:grad/screens/requestablood/request_a_blood.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

import '../../cubits/isEligable/check_eligibility_cubit.dart';

class RowCategoriesHomeScreen extends StatefulWidget {

  const RowCategoriesHomeScreen({
    super.key,

  });

  @override
  State<RowCategoriesHomeScreen> createState() => _RowCategoriesHomeScreenState();
}

class _RowCategoriesHomeScreenState extends State<RowCategoriesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final isDonatedCubit=BlocProvider.of<GetCurrentUserCubit>(context).userData["IsDonor"];
    // final hasDone = BlocProvider.of<GetCurrentUserCubit>(context).userData["hasDone"];
    double screenWidth = MediaQuery.of(context).size.width;
    Stream<DocumentSnapshot> documentStream = FirebaseFirestore.instance.collection(kUserCollectionName).doc(FirebaseAuth.instance.currentUser!.uid).snapshots();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05, // Adjusted based on screen width
        vertical: screenWidth * 0.1, // Adjusted based on screen width
      ),
      child: Row(
        children: [
          Expanded(
           child: StreamBuilder<DocumentSnapshot>(
             stream: documentStream,
             builder: (context, snapshot) =>CustomCategoryHomeScreen(
               text: "Donate Now",
               icon: MaterialSymbolsIcons.Symbols.heart_plus,
               //navigateToScreen: const EligibilityCheck(),
               onTap: () {
                 debugPrint("isDonatedCubit: ${snapshot.data!["IsDonor"]}");
                  debugPrint("hasDone: ${snapshot.data!["hasDone"]}");
                 if( snapshot.data!["IsDonor"] == true && snapshot.data!["hasDone"] == true){
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => const DonateNow(),
                     ),
                   );
                 }else if (snapshot.data!["IsDonor"] == false && snapshot.data!["hasDone"] == true){
                   showScaffoldMessenger(context: context, message: "Not Eligible to donate", color: kPrimaryColor);
                 }else{
                   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(create: (BuildContext context) {
                          return CheckEligibilityCubit();
                        },
                        child: const EligibilityCheck()),
                      ),
                   );
                 }
               },
             ),
           ),
          ),
          SizedBox(
            width: screenWidth * 0.05, // Adjusted based on screen width
          ),
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Request a Blood",
              icon: MaterialSymbolsIcons.Symbols.bloodtype,
              // navigateToScreen: DonateNow(),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const RequestBlood(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
