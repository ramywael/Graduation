import 'package:flutter/material.dart';

class UrgentRequestsBloodRequestContainer extends StatefulWidget {
  final double screenWidth;
  const UrgentRequestsBloodRequestContainer(
      {Key? key, required this.screenWidth})
      : super(key: key);

  @override
  State<UrgentRequestsBloodRequestContainer> createState() =>
      _UrgentRequestsBloodRequestContainerState();
}

class _UrgentRequestsBloodRequestContainerState
    extends State<UrgentRequestsBloodRequestContainer> {
  int bloodBracketCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth * 0.25,
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
      child: Row(
        children: [
          const Spacer(flex: 1),
          IconButton(
              onPressed: () {
                setState(() {
                  if (bloodBracketCount > 0) {
                    bloodBracketCount--;
                  }
                },
                );
              },
              icon: const Icon(
                Icons.remove,
              )),
          Text(
            '$bloodBracketCount',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: widget.screenWidth * 0.075,
              fontFamily: 'Roboto-Regular',
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  bloodBracketCount++;
                });
              },
              icon: const Icon(
                Icons.add,
              )),
          const Spacer(flex: 7),
          Text(
            'Urgent Request',
            style: TextStyle(
              fontSize: widget.screenWidth * 0.04,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto-Regular',
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
