import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/contents/contents_onBiarding_Model.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===============>User is currently signed out!');
      } else {
        print('================>User is signed in!');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
        itemCount: onBoardingList.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                onBoardingList[index].image,
                height: screenHeight * 0.6,
              ),
              Text(
                onBoardingList[index].title ?? "",
                style: TextStyle(
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Padding(
                padding: onBoardingList[index].description != null
                    ? EdgeInsets.all(screenWidth * 0.04)
                    : const EdgeInsets.all(0),
                child: Text(
                  textAlign: TextAlign.center,
                  onBoardingList[index].description ?? "",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.099,
                ),
                width: (onBoardingList[index].buttonText != null)
                    ? double.infinity
                    : 0,
                height: (onBoardingList[index].buttonText != null)
                    ? screenHeight * 0.055
                    : 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF811F1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.045),
                    ),
                  ),
                  onPressed: () {
                    if (currentIndex < onBoardingList.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.bounceOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    onBoardingList[index].buttonText ?? "",
                    style: TextStyle(
                      fontSize: screenWidth * 0.039,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  screenWidth * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      onBoardingList.length,
                      (index) => Container(
                        width: currentIndex == index
                            ? screenWidth * 0.15
                            : screenWidth * 0.09,
                        height: 8,
                        margin: EdgeInsets.all(
                          screenWidth * 0.01,
                        ),
                        //color: index == 0 ? const Color(0xFF811F1A) : const Color(0xFFD4D4D4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.02,
                          ),
                          color: currentIndex == index
                              ? kPrimaryColor
                              : const Color(0xFFD4D4D4),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
