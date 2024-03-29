import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/curved_navigation_bar.dart';
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
  String _value = "A+";
  UrgencyLevel? selectedUrgency;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: CustomTextWidget(
              text: "Personal Details",
              fontSize: 24,
              color: Colors.black,
              fontFamily: "Roboto",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: kBoxShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Blood Type : $_value",
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      DropdownButton<String>(
                        value: _value,
                        items: bloodGroups
                            .map<DropdownMenuItem<String>>((bloodType) {
                          return DropdownMenuItem<String>(
                            value: bloodType,
                            child: Text(bloodType),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: CustomTextWidget(
                      text: "Current Requests:",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: "Requester",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      CustomTextWidget(
                        text: "Koller West",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextWidget(
                        text: "Blood Type Needed:",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomTextWidget(
                          text: _value,
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: kBoxShadow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton<UrgencyLevel>(
                          hint: const CustomTextWidget(
                            text: "Urgency Level",
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          value: selectedUrgency,
                          items: UrgencyLevel.values
                              .map<DropdownMenuItem<UrgencyLevel>>(
                                  (urgencyLevel) {
                            return DropdownMenuItem(
                              value: urgencyLevel,
                              child:
                                  Text(urgencyLevel.toString().split(".").last),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedUrgency = value!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 26),
                        child: CustomTextWidget(
                          text: selectedUrgency == null
                              ? "Urgency Level"
                              : selectedUrgency.toString().split(".").last,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const CustomCurvedNavBar(
            screens: [
              HomePage(),
              RequestBlood(),
              HomePage(),
            ],
              icon1: MaterialSymbolsIcons.Symbols.home,
              icon2: MaterialSymbolsIcons.Symbols.bloodtype,
              icon3: MaterialSymbolsIcons.Symbols.person)
        ],
      ),
    );
  }
}
