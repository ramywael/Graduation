import 'package:flutter/material.dart';

import '../../custom_widgets/buttons_of_radio/row_of_buttons.dart';
import '../../custom_widgets/custom_clipper.dart';


class RateExperience extends StatelessWidget {
  const RateExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff81201a),
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              IconButton(onPressed: (){},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Color(0xffc2c2c2),
                ),
              ),
              const Text(
                'Rate your experience',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto-Regular'
                ),
              ),
            ]
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.bookmark,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Stack(
                  children: [
                    Container(
                      color: const Color(0xff81201a),
                      height: 280,
                      width: double.infinity,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage('assets/images/rate.png'),
                          height: 240,
                          width: 320,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 7,right: 25),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rate the staff\'s friendliness',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Regular'
                      ),
                    ),
                    const Text(
                      'Provide feedback for improvement',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff7d7d7d),
                          fontFamily: 'Roboto-Regular'
                      ),
                    ),
                    const SizedBox(height: 23,),
                    const Text(
                      'Rate the cleanliness of the facility',
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 18,),
                    const RowOfButtons(),
                    const SizedBox(height: 23,),
                    const Text(
                      'Rate the waiting time',
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 18,),
                    const RowOfButtons(),
                    const SizedBox(height: 23,),
                    const Text(
                      'Rate the overall experience',
                      style: TextStyle(
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 18,),
                    const RowOfButtons(),
                    const SizedBox(height: 23,),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            offset: const Offset(1, 3),
                            blurRadius: 6,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 27),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Provide Comments for improvement',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xff7d7d7d),
                              )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff81201a),
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        child: const Text(
                          'Submit feedback',
                          style: TextStyle(
                              color: Color(0xff81201a),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
