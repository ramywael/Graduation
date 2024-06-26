import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodTypeContainer extends StatelessWidget {
  const BloodTypeContainer({super.key,
    required this.bloodType,
    required this.name,
    required this.governorate,
    required this.timeLimit
  });
  final String bloodType;
  final String name;
  final String governorate;
  final String timeLimit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              offset: const Offset(1, 3),
              blurRadius: 6,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Blood Type: ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                    Text(
                      bloodType,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Donor Name: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Governorate: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                    Text(
                      governorate,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Time Limit: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                    Text(
                      timeLimit,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Roboto-Regular"
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                        color: const Color(0xff81201a),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(onPressed: (){},
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto-Regular'
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                        color: const Color(0xff81201a),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(onPressed: (){},
                        child: const Text(
                          'Refuse',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto-Regular'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
