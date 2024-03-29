import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class ListViewDonors extends StatelessWidget {
  const ListViewDonors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kBoxShadow,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  const ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              trailing: Icon(
                Icons.arrow_forward,
                color: kPrimaryColor,
              ),
              title: Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "New York",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Row(
                  children: [
                    Icon(
                      Icons.bloodtype,
                      fill: 1,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "A+",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}