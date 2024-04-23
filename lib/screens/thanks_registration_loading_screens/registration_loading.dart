import 'package:flutter/material.dart';

class RegistrationLoading extends StatelessWidget {
  const RegistrationLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double fontSize = screenSize.width < 600 ? 35 : 30;
    final double buttonHeight = screenSize.width < 600 ? 55 : 40;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          size: screenSize.width < 600 ? 28 : 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Image(
              image: AssetImage("assets/images/Icon_spinner.png"),
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenSize.height * 0.12),
            Text(
              'Registration',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  fontFamily: 'Roboto-Bold'
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            Image(
              image: const AssetImage("assets/images/admin_contact.png"),
              fit: BoxFit.cover,
              height: screenSize.height * 0.052,
            ),
            const Spacer(flex: 3),
            Container(
              width: double.infinity,
              height: buttonHeight,
              decoration: BoxDecoration(
                  color: const Color(0xff81201a),
                  borderRadius: BorderRadius.circular(70)
              ),
              child: TextButton(
                onPressed: (){},
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width < 600 ? 18 : 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.7
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
          ],
        ),
      ),
    );
  }
}

