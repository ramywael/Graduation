import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
as MaterialSymbolsIcons;

class ContentOfHeaderHomePage extends StatelessWidget {
  const ContentOfHeaderHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> acceptedRequests = FirebaseFirestore.instance.collection(kUserCollectionName).snapshots();
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.07), // Adjusted based on screen width
      child: Column(
        children: [
          CustomTextWidget(
            text: "Prominent Blood Donation Counter:",
            fontSize: screenWidth * 0.045, // Adjusted based on screen width
          ),
          SizedBox(
            height: screenHeight * 0.03, // Adjusted based on screen height
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                MaterialSymbolsIcons.Symbols.heart_check_rounded,
                fill: 1,
                color: kPrimaryColor,
                size: screenWidth * 0.13, // Adjusted based on screen width
              ),
              SizedBox(
                width: screenWidth * 0.02, // Adjusted based on screen width
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Adjusted based on screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05), // Adjusted based on screen width
                  color: Colors.white,
                  boxShadow: kBoxShadow,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2, // Adjusted based on screen width
                    vertical: screenHeight * 0.07, // Adjusted based on screen height
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: acceptedRequests,
                    builder: (context, snapshot) {
                      // debugPrint("*********************Snapshot: ${snapshot.data!.docs.length}");
                      // debugPrint("*********************Snapshot: ${snapshot.data!.docs}");
                      // debugPrint("*********************Snapshot: ${snapshot.data!}");
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.docs.where((element) => element.get("IsSaved") == true).length.toString(), // Adjusted based on screen width
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.08, // Adjusted based on screen width
                            color: const Color(0xff413D3D),
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                            decorationThickness: 4,
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    // child: Text(
                    //   "1,003,234",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontFamily: "Roboto",
                    //     fontWeight: FontWeight.bold,
                    //     decoration: TextDecoration.lineThrough,
                    //     decorationColor: Colors.white,
                    //     decorationThickness: 2,
                    //     fontSize: screenWidth * 0.08, // Adjusted based on screen width
                    //     color: const Color(0xff413D3D),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
