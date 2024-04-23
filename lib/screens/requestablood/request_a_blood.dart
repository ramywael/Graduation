import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
import 'package:grad/custom_widgets/requestablood/personal_details.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/home/user_home_page.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class RequestBlood extends StatefulWidget {
    const RequestBlood({Key? key}) : super(key: key);

    @override
    State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: kBoxShadow,
                    ),
                    child: AppBar(
                        leading: const Icon(
                            Icons.bloodtype,
                            color: kPrimaryColor,
                            size: 30,
                            fill: 1,
                        ),
                        toolbarHeight: 80,
                        title: const CustomTextWidget(
                            text: "Request Blood",
                            fontSize: 24,
                        ),
                    ),
                ),
            ),
            body: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CustomTextWidget(
                            text: "Personal Details",
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: "Roboto",
                        ),
                    ),
                    PersonalDetailsContainer(),
                    Spacer(),
                    CustomCurvedNavBar(
                        screens: [
                            HomePage(),
                            RequestBlood(),
                            HomePage(),
                        ],
                        icon1: MaterialSymbolsIcons.Symbols.home,
                        icon2: MaterialSymbolsIcons.Symbols.bloodtype,
                        icon3: MaterialSymbolsIcons.Symbols.person,
                    )
                ],
            ),
        );
    }
}
