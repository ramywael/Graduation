//
// import 'package:flutter/material.dart';
//
// class RadioButton extends StatefulWidget {
//   const RadioButton({super.key});
//
//   @override
//   State<RadioButton> createState() => _RadioButtonState();
// }
//
// class _RadioButtonState extends State<RadioButton> {
//   bool color = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 28,
//       width: 28,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey[200]!,
//             offset: const Offset(1, 3),
//             blurRadius: 6,
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       child: GestureDetector(
//         onTap: (){
//           setState(() {
//             color = !color;
//           });
//         },
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Container(
//             height: 16,
//             width: 16,
//             decoration:  BoxDecoration(
//               color: color ? Color(0xff81201a) : Colors.white ,
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
