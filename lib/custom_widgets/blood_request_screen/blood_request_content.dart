import 'package:flutter/material.dart';

class BloodRequestContent extends StatelessWidget {
  const BloodRequestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto-Regular'
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 100,
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
          child: const Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                '3',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: 'Roboto-Regular',
                    color: Colors.black
                ),
              ),
              Spacer(
                flex: 7,
              ),
              Text(
                'Urgent Request',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          'Attached',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 120,
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
              const Spacer(
                flex: 2,
              ),
              const Icon(
                Icons.download,
                size: 50,
                color: Color(0xff81201a),
              ),
              const Spacer(
                flex: 7,
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff81201a),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    'Download',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 90,
          width: double.infinity,
          alignment: Alignment.centerLeft,
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
          child: const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text(
              '10/15/2022',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                fontFamily: 'Roboto-Regular',
              ),
            ),
          ),
        ),
        const SizedBox(height: 55,),
        Center(
          child: Container(
            width: 160,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xff81201a),
              borderRadius: BorderRadius.circular(45),
            ),
            child: TextButton(
              onPressed: (){},
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
