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
          children: [
            IconButton(
              onPressed: () {},
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
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ],
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Stack(
                    children: [
                      Container(
                        color: const Color(0xff81201a),
                        height: constraints.maxWidth * 0.6,
                        width: double.infinity,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: const AssetImage('assets/images/rate.png'),
                            height: constraints.maxWidth * 0.55,
                            width: constraints.maxWidth * 0.7,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: ColumnWidgets(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

