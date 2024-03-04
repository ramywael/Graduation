import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/contents/contents_onBiarding_Model.dart';
import 'package:grad/register.dart';
import 'package:grad/screens/home/user_home_page.dart';


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
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                height: 520,
                width: 500,
              ),
              Text(
                onBoardingList[index].title ?? "",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Padding(
                padding: onBoardingList[index].description != null
                    ? const EdgeInsets.all(14.0)
                    : const EdgeInsets.all(0),
                child: Text(
                  textAlign: TextAlign.center,
                  onBoardingList[index].description ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: (onBoardingList[index].buttonText != null)
                    ? double.infinity
                    : 0,
                height: (onBoardingList[index].buttonText != null) ? 50 : 0,
                child: Padding(
                  padding: onBoardingList[index].buttonText != null
                      ? const EdgeInsets.all(2.0)
                      : const EdgeInsets.all(0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF811F1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      onBoardingList[index].buttonText ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      onBoardingList.length,
                      (index) => Container(
                        width: currentIndex == index ? 20 : 8,
                        height: 8,
                        margin: const EdgeInsets.all(4),
                        //color: index == 0 ? const Color(0xFF811F1A) : const Color(0xFFD4D4D4),
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentIndex == index
                              ?  kPrimaryColor
                              : const  Color(0xFFD4D4D4),
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
