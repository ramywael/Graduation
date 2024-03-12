import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/screens/donateNowCategory/donate.dart';
import 'package:grad/screens/donateNowCategory/eligibility_check.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Donate Now",
              icon: MaterialSymbolsIcons.Symbols.heart_plus,
              //navigateToScreen: const EligibilityCheck(),
              onTap: isDonated
                  ? () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const EligibilityCheck(),
                      ));
                    }
                  : () {},
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomCategoryHomeScreen(
              text: "Request a Blood",
              icon: MaterialSymbolsIcons.Symbols.warehouse_rounded,
              // navigateToScreen: DonateNow(),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const DonateNow(),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
