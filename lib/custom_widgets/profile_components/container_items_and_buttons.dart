import 'package:flutter/material.dart';

// class ItemsAndButtons extends StatelessWidget {
//   const ItemsAndButtons({super.key, required this.text, required this.textNum, required this.buttonText, required this.function});
//
//   final String text;
//   final String textNum;
//   final String buttonText;
//   final Function() function;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(35.0),
//         child: Column(
//           children: [
//             Text(
//               text,
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Ubuntu',
//                   color: Color(0xff413d3d)
//               ),
//             ),
//             const SizedBox(
//               height: 35,
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 70,
//               width: 70,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey[200]!,
//                     offset: const Offset(1, 3),
//                     blurRadius: 6,
//                     spreadRadius: 3,
//                   ),
//                 ],
//               ),
//               child: Text(
//                 textNum,
//                 style: const TextStyle(
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Color(0xff413d3d),
//                   decoration: TextDecoration.lineThrough,
//                   decorationColor: Colors.white,
//                   decorationThickness: 1,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 65,
//             ),
//             Container(
//               height: 45,
//               width: 140,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     color: const Color(0xff81201a),
//                   ),
//                   borderRadius: BorderRadius.circular(13)
//               ),
//               child: MaterialButton(
//                 onPressed: function,
//                 child: Text(
//                   buttonText,
//                   style: const TextStyle(
//                       fontSize: 15,
//                       fontFamily: 'Roboto',
//                       color: Color(0xff81201a)
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


class ItemsAndButtons extends StatelessWidget {
  const ItemsAndButtons({
    super.key,
    required this.text,
    required this.textNum,
    required this.buttonText,
    required this.function,
  });

  final String text;
  final String textNum;
  final String buttonText;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.09),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w500,
                fontFamily: 'Ubuntu',
                color: const Color(0xff413d3d),
              ),
            ), /// The header Text of the container
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Container(
              alignment: Alignment.center,
              height: screenWidth * 0.14,
              width: screenWidth * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    offset: const Offset(1, 3),
                    blurRadius: screenWidth * 0.014,
                    spreadRadius: screenWidth * 0.005,
                  ),
                ],
              ),
              child: Text(
                textNum,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                  color: const Color(0xff413d3d),
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.09,
            ),
            Container(
              height: screenWidth * 0.12,
              width: screenWidth * 0.30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff81201a),
                ),
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: MaterialButton(
                onPressed: function,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.033,
                    fontFamily: 'Roboto',
                    color: const Color(0xff81201a),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
