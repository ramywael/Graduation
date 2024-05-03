import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';

class TimeBloodRequestContainer extends StatefulWidget {
  const TimeBloodRequestContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<TimeBloodRequestContainer> createState() => _TimeBloodRequestContainerState();
}

class _TimeBloodRequestContainerState extends State<TimeBloodRequestContainer> {
   DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth * 0.25,
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
      child: ListTile(
        title: Text(
          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: widget.screenWidth * 0.06,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        trailing: IconButton(
          onPressed: ()  async{
           DateTime? newDate = await showDatePicker(
             builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(primary: kPrimaryColor),
                    buttonTheme: const ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                  child: child!,
                );
             },
              context: context,
              initialDate: selectedDate,
              firstDate: selectedDate,
              lastDate: selectedDate.add(const Duration(days: 365)),
            );
           if(newDate==null) return;
           setState(() {
             selectedDate=newDate;
           });
          },
          icon: Icon(
            Icons.calendar_today,
            color: kPrimaryColor,
            size: widget.screenWidth * 0.08,
          ),
        ),
      ),
    );
  }
}
