import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class TimeSlotContainer extends StatefulWidget {
  final double screenWidth;
  final Function(int) onHourSelected; // Add callback function

  const TimeSlotContainer({
    Key? key,
    required this.screenWidth,
    required this.onHourSelected, // Initialize callback function
  }) : super(key: key);

  @override
  State<TimeSlotContainer> createState() => _TimeSlotContainerState();
}

class _TimeSlotContainerState extends State<TimeSlotContainer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: widget.screenWidth * 0.03,
        horizontal: widget.screenWidth * 0.035,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: widget.screenWidth * 0.05,
        vertical: widget.screenWidth * 0.05,
      ),
      decoration: BoxDecoration(
        boxShadow: kBoxShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.screenWidth * 0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(widget.screenWidth * 0.03),
            child: Text(
              "Select Time",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: widget.screenWidth * 0.045,
              ),
            ),
          ),
          SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: hoursOfWork.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  widget.onHourSelected(hoursOfWork[index]); // Call the callback function
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: widget.screenWidth * 0.009,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.019,
                    vertical: widget.screenWidth * 0.012,
                  ),
                  decoration: BoxDecoration(
                    color: currentIndex == index ? kPrimaryColor : Colors.white,
                    boxShadow: kBoxShadow,
                    borderRadius: BorderRadius.circular(widget.screenWidth * 0.04),
                  ),
                  child: Center(
                    child: Text(
                      "${hoursOfWork[index]}:00",
                      style: TextStyle(
                        color: currentIndex == index ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.screenWidth * 0.035,
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
