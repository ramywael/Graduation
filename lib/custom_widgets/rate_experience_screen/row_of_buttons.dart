import 'package:flutter/material.dart';


class RowOfButtons extends StatefulWidget {
  const RowOfButtons({super.key});

  @override
  State<RowOfButtons> createState() => _RowOfButtonsState();
}

class _RowOfButtonsState extends State<RowOfButtons> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
      return  GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3.5,
          ),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  currentIndex = index;
                });
              },
              child: Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
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
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration:  BoxDecoration(
                          color: currentIndex==index ? const Color(0xff81201a) : Colors.white ,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    //     const Row(
    //   children: [
    //     Row(
    //      children: [
    //        RadioButton(),
    //        Padding(
    //          padding: EdgeInsets.only(left: 7),
    //          child: Text(
    //            '1',
    //            style: TextStyle(
    //                color: Colors.black,
    //                fontSize: 20
    //            ),
    //          ),
    //        ),
    //      ],
    //    ),
    //     SizedBox(width: 45,),
    //     Row(
    //       children: [
    //         RadioButton(),
    //         Padding(
    //           padding: EdgeInsets.only(left: 7),
    //           child: Text(
    //             '2',
    //             style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize:20
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     SizedBox(width: 45,),
    //     Row(
    //       children: [
    //         RadioButton(),
    //         Padding(
    //           padding: EdgeInsets.only(left: 7),
    //           child: Text(
    //             '3',
    //             style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 20
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     SizedBox(width: 45,),
    //     Row(
    //       children: [
    //         RadioButton(),
    //         Padding(
    //           padding: EdgeInsets.only(left: 7),
    //           child: Text(
    //             '4',
    //             style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 20
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
// ButtonBar(
//   alignment: MainAxisAlignment.center,
//   children: [
//     Radio(
//       value: 1,
//       groupValue: selectedRadio,
//       onChanged: (value){
//           print("Radio $value");
//           setSelectedRadio(value!);
//         },
//     ),
//     Radio(
//         value: 2,
//         groupValue: selectedRadio,
//         onChanged: (value){
//           print("Radio $value");
//           setSelectedRadio(value!);
//         }),
//     Radio(
//         value: 3,
//         groupValue: selectedRadio,
//         onChanged: (value){
//           print("Radio $value");
//           setSelectedRadio(value!);
//         }),
//     Radio(
//         value: 4,
//         groupValue: selectedRadio,
//         onChanged: (value){
//           print("Radio $value");
//           setSelectedRadio(value!);
//         }),
//   ],
