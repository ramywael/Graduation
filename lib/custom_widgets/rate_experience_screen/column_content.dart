import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/rate_experience_screen/row_of_buttons.dart';

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rate the staff\'s friendliness',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto-Regular'
          ),
        ),
        const Text(
          'Provide feedback for improvement',
          style: TextStyle(
              fontSize: 17,
              color: Color(0xff7d7d7d),
              fontFamily: 'Roboto-Regular'
          ),
        ),
        const SizedBox(height: 23,),
        const Text(
          'Rate the cleanliness of the facility',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 18,),
        const RowOfButtons(),
        const SizedBox(height: 23,),
        const Text(
          'Rate the waiting time',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 18,),
        const RowOfButtons(),
        const SizedBox(height: 23,),
        const Text(
          'Rate the overall experience',
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 18,),
        const RowOfButtons(),
        const SizedBox(height: 23,),
        Container(
          alignment: Alignment.centerLeft,
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(1, 3),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 27),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Provide Comments for improvement',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff7d7d7d),
                  )
              ),
            ),
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff81201a),
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: MaterialButton(
            onPressed: (){},
            child: const Text(
              'Submit feedback',
              style: TextStyle(
                  color: Color(0xff81201a),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
