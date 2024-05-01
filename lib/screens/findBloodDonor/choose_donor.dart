import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/findBloodDonor/choose_donor_body.dart';

import '../../cubits/find_blood_donor/find_blood_donor_cubit.dart';

class ChooseDonor extends StatefulWidget {
  const ChooseDonor({Key? key}) : super(key: key);

  @override
  State<ChooseDonor> createState() => _ChooseDonorState();
}

class _ChooseDonorState extends State<ChooseDonor> {

  @override
  initState() {
    BlocProvider.of<FindBloodDonorCubit>(context).getDonors();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive font size
    final titleFontSize = screenWidth * 0.07;

    // Responsive padding
    final double verticalPadding = screenHeight * 0.005;
    final double horizontalPadding = screenWidth * 0.005;

    final donorList = BlocProvider.of<FindBloodDonorCubit>(context).donorList;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[2],
          ),
          child: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
            title: CustomTextWidget(
              text: "Blood Connect",
              fontSize: titleFontSize,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child:ChooseDonorsBody(donorList:donorList,),
      ),
    );
  }
}
