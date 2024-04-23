import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/screens/donateNowCategory/donate.dart';
import 'package:grad/screens/donateNowCategory/eligibility_check.dart';
import 'package:grad/screens/requestablood/request_a_blood.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class RowCategoriesHomeScreen extends StatelessWidget {
  final bool isDonated;
  const RowCategoriesHomeScreen({
    super.key,
    required this.isDonated,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,  // Adjusted based on screen width
        vertical: screenWidth * 0.1,      // Adjusted based on screen width
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Donate Now",
              icon: MaterialSymbolsIcons.Symbols.heart_plus,
              //navigateToScreen: const EligibilityCheck(),
              onTap: isDonated
                  ? () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EligibilityCheck(),
                ));
              }
                  : () {},
            ),
          ),
          SizedBox(
            width: screenWidth * 0.05,    // Adjusted based on screen width
          ),
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Request a Blood",
              icon: MaterialSymbolsIcons.Symbols.warehouse_rounded,
              // navigateToScreen: DonateNow(),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>  const RequestBlood(),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
