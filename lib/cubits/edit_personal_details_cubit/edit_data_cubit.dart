import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/edit_personal_details_cubit/edit_data_states.dart';
import 'package:grad/services/notification_service.dart';
import '../../constants/constant.dart';
import 'package:flutter/material.dart';
import '../../screens/login_signup_forgetpass_screens/login.dart';

class EditDataCubit extends Cubit<EditDataStates>{
  EditDataCubit() : super (EditDataInitialState());

  static EditDataCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailAddress = TextEditingController();
  final homeAddress = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late final DocumentSnapshot userData;


  void updateData() async {
    emit(GetNewDataStateLoading());
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection(kUserCollectionName)
        .doc(user!.uid)
        .update({
      'Name': nameController.text,
      'PhotoUrl': phoneController.text,
      'Email': emailAddress.text,
      'location': homeAddress.text,
      'token' : NotificationService.me.token,
    });
    emit(GetNewDataStateSuccess());
    await user.updateEmail(emailAddress.text);
  }
  Future <void> signOut(context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView()));
  }
}