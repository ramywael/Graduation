import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/find_blood_donor/find_blood_donor_cubit.dart';
import 'package:grad/screens/chat/chat_view.dart';

class ListViewDonors extends StatelessWidget {
  final List donorList;
  const ListViewDonors({Key? key, required this.donorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalPadding = screenHeight * 0.02;

    // Responsive font sizes
    final titleFontSize = screenWidth * 0.05;
    final subtitleFontSize = screenWidth * 0.04;

    // Responsive icon size
    final iconSize = screenWidth * 0.12;
    return Expanded(
      child: BlocBuilder<FindBloodDonorCubit, FindBloodDonorState>(
        builder: (context, state) {
          if (state is FindBloodDonorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FindBloodDonorFailure) {
            return const Center(
              child: Text(
                "Failed to load donors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (state is FindBloodDonorSuccess) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              itemCount: donorList.length,
              // Adjust itemCount based on your data
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: verticalPadding * 0.65),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: kElevationToShadow[4],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding / 0.91),
                    trailing: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return ChatView(
                                receiverEmail: donorList[index]["Email"],
                                receiverID: donorList[index]["uid"],
                                receiverName: donorList[index]["Name"],
                              );
                            }
                            ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.red, // Adjust color as needed
                      ),
                    ),
                    title: Text(
                      donorList[index]["Name"],
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      donorList[index]["location"],
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                      ),
                    ),
                    leading: SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.bloodtype,
                            size: iconSize * 0.5,
                            color: Colors.red, // Adjust color as needed
                          ),
                          Text(
                            donorList[index]["BloodType"],
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red, // Adjust color as needed
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "No Eligible Donors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
