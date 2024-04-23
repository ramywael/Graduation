import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({
    Key? key,
    required this.image,
    required this.firstTextImage,
    required this.secondTextImage,
  }) : super(key: key);

  final String image;
  final String firstTextImage;
  final String secondTextImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(image),
                  height: constraints.maxHeight * 0.45,
                  width: constraints.maxWidth * 0.8,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Image(
                    width: constraints.maxWidth * 0.9,
                    image: AssetImage(firstTextImage),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Image(
                    width: constraints.maxWidth * 0.55,
                    image: AssetImage(secondTextImage),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Container(
                  height: constraints.maxHeight * 0.08,
                  width: constraints.maxWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xff81201a),
                    ),
                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: const Color(0xff81201a),
                        fontFamily: 'Roboto-Regular',
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}