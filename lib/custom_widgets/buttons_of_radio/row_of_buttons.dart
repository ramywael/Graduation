import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/buttons_of_radio/radio_button.dart';


class RowOfButtons extends StatelessWidget {
  const RowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        RadioButton(),
        Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            '1',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
        ),
        SizedBox(width: 45,),
        RadioButton(),
        Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            '2',
            style: TextStyle(
                color: Colors.black,
                fontSize:20
            ),
          ),
        ),
        SizedBox(width: 45,),
        RadioButton(),
        Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            '3',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
        ),
        SizedBox(width: 45,),
        RadioButton(),
        Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            '4',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
        ),
      ],
    );
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
