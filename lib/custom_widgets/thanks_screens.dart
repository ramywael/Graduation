import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key,
    required this.image,
    required this.firstTextImage,
    required this.secondTextImage,
  });

  final String image;
  final String firstTextImage;
  final String secondTextImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
                height: 300 ,
                width: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 45,),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image(
                  width: 400,
                  image: AssetImage(firstTextImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                alignment: AlignmentDirectional.center,
                child: Image(
                  width: 250,
                  image: AssetImage(secondTextImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 35,),
              Container(
                height: 55,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xff81201a),
                    )
                ),
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      color: Color(0xff81201a),
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
