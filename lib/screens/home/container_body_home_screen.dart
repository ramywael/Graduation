import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/category_home_screen.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/donateNowCategory/donate.dart';
import 'package:grad/screens/home/row_categories_home_screen.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class ContainerHomeScreen extends StatelessWidget {
  final bool isDonated;
  const ContainerHomeScreen({
    super.key,
    required this.isDonated,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
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
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: CustomTextWidget(
                    text: "Be Today's Hero",
                    fontSize: 26,
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
            ),
            RowCategoriesHomeScreen(
              isDonated: isDonated,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70, left: 40, right: 40),
              child: CustomCategoryHomeScreen(
                text: "Find a Blood Donor",
                icon: MaterialSymbolsIcons.Symbols.warehouse_rounded,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const DonateNow(),
                    ),
                  );
                },
                // navigateToScreen: DonateNow(),
              ),
            ),
            const Expanded(child: CustomCurvedNavBar()),
          ],
        ),
      ),
    );
  }
}
