import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationLoading extends StatelessWidget {
  const RegistrationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent ,
          leading: Icon(
              Icons.arrow_back,
            size: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1,),
              Image(
                  image: AssetImage("assets/images/Icon_spinner.png"),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 110,),
              Text(
                'Registration',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Roboto-Bold'
                ),
              ),
              SizedBox(height: 10,),
              Image(
                  image: AssetImage("assets/images/admin_contact.png"),
                fit: BoxFit.cover,
                height: 45,
              ),
              Spacer(flex: 3,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff81201a),
                  borderRadius: BorderRadius.circular(70)
                ),
                child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.7
                      ),
                    ),
                ),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
