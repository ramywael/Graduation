import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom/text.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart'
    as MaterialSymbolsIcons;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 80,horizontal: 20),
              // width: 343,
              // height: 191,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(5, 5),
                    blurRadius: 12,
                    spreadRadius: 5,
                  )
                ],
              ),
              child:  Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    const CustomTextWidget(
                      text: "Prominent Blood Donation Counter:",
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          MaterialSymbolsIcons.Symbols.heart_check_rounded,
                          fill: 1,
                          color: kPrimaryColor,
                          size: 45,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(2, 2),
                                blurRadius: 10,
                                spreadRadius: 3,
                              ),
                            ]
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,),
                            child: Text(
                              "1,003,234",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.white,
                                decorationThickness: 2,
                                fontSize: 32,
                                color: Color(0xff413D3D),
                              ),
                            ),
                          ) ,

                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
