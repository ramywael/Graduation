import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class TimeSlotContainer extends StatefulWidget {
  const TimeSlotContainer({Key? key}) : super(key: key);

  @override
  State<TimeSlotContainer> createState() => _TimeSlotContainerState();
}

class _TimeSlotContainerState extends State<TimeSlotContainer> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        boxShadow: kBoxShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Select Time",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SingleChildScrollView(
            child: GridView.builder(
              // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              shrinkWrap: true,
              itemCount: hoursOfWork.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? kPrimaryColor
                        : Colors.white,
                    boxShadow: kBoxShadow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "${hoursOfWork[index]}:00",
                      style: TextStyle(
                        color: currentIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
