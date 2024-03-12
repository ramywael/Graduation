import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kBoxShadow,
          borderRadius: BorderRadius.circular(
            20,
          )),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search by Blood Group",
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}
