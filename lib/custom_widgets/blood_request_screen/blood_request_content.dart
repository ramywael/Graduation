import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/request_a_blood/request_blood_cubit.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/custom_widgets/blood_request_screen/time_blood_request_container.dart';
import 'package:grad/custom_widgets/blood_request_screen/urgent_blood_request_container.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import 'package:image_picker/image_picker.dart';
import 'attached_blood_request_container.dart';

class BloodRequestContent extends StatefulWidget {
  final String bloodType;
  final UrgencyLevel urgencyLevel;
  const BloodRequestContent({super.key, required this.bloodType, required this.urgencyLevel});

  @override
  State<BloodRequestContent> createState() => _BloodRequestContentState();
}

class _BloodRequestContentState extends State<BloodRequestContent> {
  File? file;
  int bloodBracketsCount = 0;
  String? url;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Blood Brackets',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        UrgentRequestsBloodRequestContainer(
          bloodBracketCount: bloodBracketsCount,
          onDecrement: () {
            if (bloodBracketsCount > 0) {
              setState(() {
                bloodBracketsCount--;
              });
            }
          },
          screenWidth: screenWidth,
          onIncrement: () {
            setState(() {
              bloodBracketsCount++;
            });
          },
        ),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Attached',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        AttachedBloodRequestContainer(
          screenWidth: screenWidth,
          onUpload: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? photo =
                await picker.pickImage(source: ImageSource.camera);
            if (photo != null) {
              file = File(photo.path);
              var imageName = basename(photo.path);
              var reference = FirebaseStorage.instance
                  .ref()
                  .child('bloodRequest/$imageName');
              await reference.putFile(file!);
              url = await reference.getDownloadURL();
            }
            setState(() {});
            debugPrint('************************File Uploaded');
          },
        ),
        SizedBox(height: screenWidth * 0.09),
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto-Regular',
          ),
        ),
        SizedBox(height: screenWidth * 0.025),
        TimeBloodRequestContainer(
          selectedDate: selectedDate,
          screenWidth: screenWidth,
          onDateChanged: () async {
            DateTime? newDate = await showDatePicker(
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme:
                        const ColorScheme.light(primary: kPrimaryColor),
                    buttonTheme: const ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                  child: child!,
                );
              },
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 0)),
              lastDate: selectedDate.add(const Duration(days: 365)),
            );
            if (newDate == null) return;
            setState(() {
              selectedDate = newDate;
            });
          },
        ),
        SizedBox(height: screenWidth * 0.07),
        Center(
          child: Container(
            width: screenWidth * 0.4,
            height: screenWidth * 0.13,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(45),
            ),
            child: BlocBuilder<RequestBloodCubit, RequestBloodState>(
                builder: (context, state) {
              return CustomButtonConnection(
                isLoading: state is RequestBloodLoading,
                buttonText: "Submit",
                onPressed: () {
                  if (url != null && bloodBracketsCount != 0) {
                    BlocProvider.of<RequestBloodCubit>(context).addRequestBlood(
                      widget.bloodType,
                      widget.urgencyLevel.toString().split('.').last,
                      bloodBracketsCount,
                      url!,
                      selectedDate,
                      context,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please upload the image'),
                      ),
                    );
                  }
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
