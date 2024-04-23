import 'package:flutter/material.dart';
import '../../custom_widgets/custom_clipper.dart';
import '../../custom_widgets/rate_experience_screen/column_content.dart';


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
            const Padding(
              padding: EdgeInsets.only(left: 25,top: 7,right: 25),
              child: SizedBox(
                width: double.infinity,
                child: ColumnWidgets(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
