import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/donate_now/donate_now_cubit.dart';
import '../../contents/donatenow/eligability_check_model.dart';
import '../../screens/donateNowCategory/donate.dart';
import '../../screens/home/user_home_page.dart';
part 'check_eligibility_state.dart';

class CheckEligibilityCubit extends Cubit<CheckEligibilityState> {
  CheckEligibilityCubit() : super(CheckEligibilityInitial());
  List<String> userAnswers = [];
  int currentQuestionIndex = 0;
  bool isEligible = false;
  bool hasDone = false;

  void answerWithNo(context) {
    emit(CheckEligibilityInitial());
    userAnswers.add("No");
    currentQuestionIndex++;
    emit(CheckEligibilityInProgress());
    debugPrint("Current Question Index: $currentQuestionIndex");
    if (currentQuestionIndex == questionsModel.length - 1) {
      showScaffoldMessenger(
        context: context,
        message: "You are eligible to donate",
        color: kSecondaryColor,
      );
      isEligible = true;
      hasDone = true;
      try {
        FirebaseFirestore.instance
            .collection(kUserCollectionName)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "IsDonor": isEligible,
        });
        debugPrint("****************User is Donor");
      } catch (e) {
        debugPrint(e.toString());
        emit(CheckEligibilityFailure());
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
      FirebaseFirestore.instance
          .collection(kUserCollectionName)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "hasDone": hasDone,
      });
      emit(CheckEligibilitySuccess());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (BuildContext context) {
                return DonateNowCubit()..getBloodRequests();
              }, child: const DonateNow()),
        ),
      );
    }
  }
  void answerWithYes(context) {
    userAnswers.add("Yes");
    isEligible = false;
    hasDone = true;
    FirebaseFirestore.instance
        .collection(kUserCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "IsDonor": isEligible,
      "hasDone": hasDone,
    });
    emit(CheckEligibilityFailure());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
