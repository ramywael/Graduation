import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/contents/home/content_categories.dart';
import 'package:grad/custom/text.dart';
import 'package:grad/screens/home/header_of_home_screen.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderOfHomeScreen(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: CustomTextWidget(
                          text: "Be Today's Hero",
                          fontSize: 26,
                          fontFamily: "Pacifico",
                        ),
                      ),
                    ),
                  ),
                   const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                     child: Row(
                     children: [
                       Expanded(
                         child: CustomCategoryHomeScreen(
                             text: "Donate Now",
                             icon: MaterialSymbolsIcons.Symbols.heart_plus),
                       ),
                       SizedBox(
                          width: 20,
                       ),
                       Expanded(
                         child: CustomCategoryHomeScreen(
                             text: "Request a Blood",
                             icon: MaterialSymbolsIcons.Symbols.warehouse_rounded),
                       )
                     ],
                  ),
                   ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 140, left: 40, right: 40),
                    child: CustomCategoryHomeScreen(
                      text: "Find a Blood Donor",
                      icon: MaterialSymbolsIcons.Symbols.warehouse_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCategoryHomeScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomCategoryHomeScreen({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 255, 255, 255).withOpacity(0.5),
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 3
          )

        ]
      ),
      child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Icon(
              icon,
              fill: 1,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          )),
    );
  }
}
