import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../text.dart';

class PersonalDetailsContainer extends StatefulWidget {
  const PersonalDetailsContainer({super.key});

  @override
  State<PersonalDetailsContainer> createState() => _PersonalDetailsContainerState();
}
class _PersonalDetailsContainerState extends State<PersonalDetailsContainer> {
  String _value = "A+";
  UrgencyLevel? selectedUrgency;

  @override
  Widget build(BuildContext context) {
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
                  text: "Blood Type : $_value",
                  fontSize: 24,
                  color: Colors.black,
                ),
                DropdownButton<String>(
                  value: _value,
                  items: bloodGroups
                      .map<DropdownMenuItem<String>>((bloodType) {
                    return DropdownMenuItem<String>(
                      value: bloodType,
                      child: Text(bloodType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "Requester",
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                CustomTextWidget(
                  text: "Koller West",
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
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomTextWidget(
                    text: _value,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
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
                    onChanged: (value) {
                      setState(() {
                        selectedUrgency = value!;
                      });
                    },
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
