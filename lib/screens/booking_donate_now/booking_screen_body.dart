import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import 'package:grad/custom_widgets/profile_components/custom_button.dart';
import 'package:grad/custom_widgets/table_calender.dart';
import 'package:grad/screens/booking_donate_now/time_slot_container.dart';
import 'package:grad/screens/thanks_registration_loading_screens/thanks_for_saving_life.dart';

import '../../cubits/donate_request_time/select_time_request_cubit.dart';

class BookingScreenBody extends StatefulWidget {
  final double screenWidth;
  final String bloodRequestId;
  final DateTime estimatedTime;
  final int bloodBracketCount;
  final String userRequestId;


  const BookingScreenBody({
    Key? key,
    required this.screenWidth,
    required this.bloodRequestId,
    required this.estimatedTime,
    required this.bloodBracketCount, required this.userRequestId,
  }) : super(key: key);

  @override
  _BookingScreenBodyState createState() => _BookingScreenBodyState();
}

class _BookingScreenBodyState extends State<BookingScreenBody> {
  DateTime? _selectedTime;
  int? _selectedHour;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableBasicsExample(
          estimatedTime: widget.estimatedTime,
          screenWidth: widget.screenWidth,
          onDaySelected: (selectedDay) {
            setState(() {
              _selectedTime = selectedDay;
            });
          },
        ),
        TimeSlotContainer(
          screenWidth: widget.screenWidth,
          onHourSelected: (selectedHour) {
            setState(() {
              _selectedHour = selectedHour;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.screenWidth * 0.045,
          ),
          child: BlocBuilder<SelectTimeRequestCubit,SelectTimeRequestState>(
            builder: (context, state) =>CustomButton(
              isLoading: state is SelectTimeRequestLoading,
              padding: EdgeInsets.symmetric(
                vertical: widget.screenWidth * 0.03,
              ),
              margin: EdgeInsets.symmetric(
                vertical: widget.screenWidth * 0.03,
                horizontal: widget.screenWidth * 0.05,
              ),
              color: kSecondaryColor,
              fontSize: widget.screenWidth * 0.035,
              text: "Confirm",
              onTap: () {
                if (_selectedTime != null && _selectedHour != null) {
                  debugPrint('$_selectedTime');
                  BlocProvider.of<SelectTimeRequestCubit>(context).addTimeRequest(
                    recipientId: widget.userRequestId,
                    context: context,
                    hourSlot: _selectedHour!,
                    date: _selectedTime!,
                    bloodRequestId: widget.bloodRequestId,
                    bloodBracketCount: widget.bloodBracketCount,
                    email: BlocProvider.of<GetCurrentUserCubit>(context).userData.get("Email"), // Get the email from the user data
                    phone: BlocProvider.of<GetCurrentUserCubit>(context).userData.get("PhotoUrl"),
                  );
                  debugPrint("Blood Request ID: ${widget.bloodRequestId}");
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
