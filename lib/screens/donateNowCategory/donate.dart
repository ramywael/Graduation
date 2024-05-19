import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/donate_now/donate_now_cubit.dart';
import 'package:grad/custom_widgets/text.dart';
import 'package:grad/screens/donateNowCategory/donate_container.dart';
import 'package:grad/screens/donateNowCategory/search_bar.dart';
import 'package:grad/screens/home/user_home_page.dart';

class DonateNow extends StatelessWidget {
  const DonateNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchComponent(
            onChanged: (p0) {
              BlocProvider.of<DonateNowCubit>(context).searchBloodRequests(p0);
            },
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
            ),
            child: CustomTextWidget(
              text: "Blood Donation Requests",
              fontSize: screenWidth * 0.065,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: BlocBuilder<DonateNowCubit, DonateNowState>(
              builder: (context, state) {
                if (state is DonateNowInitial) {
                  return const Center(
                    child: Text(
                      "No Blood Requests Available",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (state is DonateNowLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DonateNowSuccess) {
                  debugPrint(
                      "Blood Requests: ${BlocProvider.of<DonateNowCubit>(context).bloodRequestsList.length}");
                  debugPrint("Blood Requests: ${state.bloodRequests}");
                  return ListView.builder(
                    itemCount: state.bloodRequests.length,
                    itemBuilder: (context, index) => DonateContainer(
                      isFull: state.bloodRequests[index].isAccepted,
                      userRequestId: state.bloodRequests[index].uid,
                      estimatedTime: state.bloodRequests[index].date,
                      bloodRequestId: state.bloodRequests[index].id,
                      urgencyLevel: state.bloodRequests[index].urgencyLevel,
                      bloodType: state.bloodRequests[index].bloodNeeded,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      bloodBracketCount: state.bloodRequests[index].brackets,
                    ),
                  );
                } else if(state is DonateNowFailure){
                  return  Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
