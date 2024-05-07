import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import '../../constants/constant.dart';
import '../text.dart';

class PersonalDetailsContainer extends StatelessWidget {
  final void Function(String?)? onChangedBloodType;
  final void Function(UrgencyLevel?) onChangedUrgency;
  final String value ;
  final UrgencyLevel? selectedUrgency ;
  const PersonalDetailsContainer({super.key, this.onChangedBloodType, required this.onChangedUrgency, required this.selectedUrgency,  required this.value});


  @override
  Widget build(BuildContext context) {
    DocumentSnapshot name=BlocProvider.of<GetCurrentUserCubit>(context).userData;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: kBoxShadow,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "Blood Type : $value",
                  fontSize: 24,
                  color: Colors.black,
                ),
                DropdownButton<String>(
                  value: value,
                  items: bloodGroups
                      .map<DropdownMenuItem<String>>((bloodType) {
                    return DropdownMenuItem<String>(
                      value: bloodType,
                      child: Text(bloodType),
                    );
                  }).toList(),
                  onChanged: onChangedBloodType,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: CustomTextWidget(
                text: "Current Requests:",
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  text: "Requester",
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                CustomTextWidget(
                  text: name["Name"],
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  text: "Blood Type Needed:",
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextWidget(
                  text: value,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: kBoxShadow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton<UrgencyLevel>(
                    hint: const CustomTextWidget(
                      text: "Urgency Level",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    value: selectedUrgency,
                    items: UrgencyLevel.values
                        .map<DropdownMenuItem<UrgencyLevel>>(
                            (urgencyLevel) {
                          return DropdownMenuItem(
                            value: urgencyLevel,
                            child:
                            Text(urgencyLevel.toString().split(".").last),
                          );
                        }).toList(),
                    onChanged: onChangedUrgency,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 26),
                  child: CustomTextWidget(
                    text: selectedUrgency == null
                        ? "Urgency Level"
                        : selectedUrgency.toString().split(".").last,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
