import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/screens/donateNowCategory/Donate.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class RowCategoriesHomeScreen extends StatelessWidget {
  const RowCategoriesHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: CustomCategoryHomeScreen(
                text: "Donate Now",
                icon: MaterialSymbolsIcons.Symbols.heart_plus,
              navigateToScreen: DonateNow()),
            ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Request a Blood",
              icon: MaterialSymbolsIcons.Symbols.warehouse_rounded,
              navigateToScreen: DonateNow(),
            ),
          )
        ],
      ),
    );
  }
}
