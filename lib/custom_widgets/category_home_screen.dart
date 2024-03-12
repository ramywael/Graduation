import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class CustomCategoryHomeScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  //final Widget navigateToScreen;
  final Function() onTap;
  const CustomCategoryHomeScreen({
    super.key,
    required this.text,
    required this.icon,
    //required this.navigateToScreen,
    required this.onTap,
  }
);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //  Navigator.of(context).push(
      //    MaterialPageRoute(builder: (context) => navigateToScreen,)
      //  );
      // },
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255).withOpacity(0.5),
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 3)
            ]),
        child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Icon(
                icon,
                fill: 1,
                color: kPrimaryColor,
                size: 30,
              ),
            ),
            title: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            )),
      ),
    );
  }
}
