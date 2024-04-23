

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/login_and_signup_screens/custom_button.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';
import 'login.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff81201a),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              )
          ),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: const Color(0xff81201a),
                  height: 170,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 18,right: 18,bottom: 40),
                    child: Text(
                      'BloodConnect',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Creating New Password",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  CustomTextFormField(
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    // suffixIcon:  IconButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       isPassword = !isPassword;
                    //     });
                    //   },
                    //   icon: Icon(
                    //     isPassword ? Icons.visibility_off : Icons.visibility,
                    //     color: const Color(0xff81201a),
                    //   ),
                    // ),

                    labelName: "Enter new password",
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password must not be empty";
                      }
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 15,),
                  CustomTextFormField(
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    // suffixIcon:  IconButton(onPressed: () {
                    //   setState(() {
                    //     isPassword = !isPassword;
                    //   });
                    // },  icon:  Icon(
                    //   isPassword ? Icons.visibility_off : Icons.visibility,
                    //   color: const Color(0xff81201a),
                    // ),),
                    labelName: "Re-enter new password",
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password must not be empty";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 35),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                          "Password Strength:  Strong",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60,),
                  CustomButton(
                    buttonText: "Submit",
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        if (kDebugMode) {
                          print(passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const LoginView())
                          );
                        }
                      }
                    },

                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}
