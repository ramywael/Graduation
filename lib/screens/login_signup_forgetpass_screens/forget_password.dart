import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/reset_password.dart';
import '../../custom_widgets/login_and_signup_screens/custom_button_connection.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';

class ForgetPasswordView extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  const ForgetPasswordView(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: kPrimaryColor,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: widget.screenWidth * 0.05,
                            right: widget.screenWidth * 0.05,
                            top: widget.screenHeight * 0.15,
                            bottom: widget.screenHeight * 0.2,
                          ),
                          child: Text(
                            'BloodConnect',
                            style: TextStyle(
                              fontSize: widget.screenWidth * 0.1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.001),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.screenWidth * 0.05,
                                top: widget.screenHeight * 0.01,
                                bottom: widget.screenHeight * 0.01),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Forget password !",
                                style: TextStyle(
                                  fontSize: widget.screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: widget.screenHeight * 0.00005,),
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.screenWidth * 0.05,
                                top: widget.screenHeight * 0.01,
                                bottom: widget.screenHeight * 0.01
                            ),
                            child: Text(
                              "Don't worry sometimes people can forget too, enter your email and we will send you "
                                  "a password reset link",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: widget.screenWidth * 0.035,
                                  height: 1.3
                              ),
                            ),
                          ),
                          SizedBox(height: widget.screenHeight * 0.04),
                          CustomTextFormField(
                            screenWidth: constraints.maxWidth,
                            onSaved: (p0) {
                              emailController.text = p0!;
                            },
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            prefixIcon: const Icon(
                              Icons.mark_email_read,
                              color: Color(0xff81201a),
                            ),
                            hintText: "E-mail Address",
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return "Email must not be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: widget.screenHeight * 0.03),
                          CustomButtonConnection(
                            buttonText: 'Submit', onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              // try {
                              //   hasConnection(context);
                              //   await FirebaseAuth.instance.sendPasswordResetEmail(
                              //       email: emailController.text
                              //   );
                              //   Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => const ResetPasswordView()),
                              //   );
                              //
                              // }on FirebaseAuthException catch (e){
                              //   if(e.code == "invalid-email"){
                              //     showScaffoldMessenger(
                              //         context: context,
                              //         message: 'The email provided is invalid, please try again',
                              //         color: kPrimaryColor);
                              //   }
                              //   else if (e.code == ""){
                              //     showScaffoldMessenger(
                              //         context: context,
                              //         message: 'Please Don\'t Enter Your Email',
                              //         color: kPrimaryColor
                              //     );
                              //   }
                              // }]
                              formKey.currentState!.save();
                              sendPasswordResetEmail(email: emailController.text, context: context);
                            }
                          },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
Future sendPasswordResetEmail ({required String email,required context})
async{

  try {
    hasConnection(context);
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => const ResetPasswordView(),
    //   ),
    // );
    Navigator.pushNamed(context, ResetPasswordView.id, arguments: email);
    showScaffoldMessenger(
        context: context,
        message: "Email Link Sent to Reset your Password",
        color: kPrimaryColor);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint(e.toString());
      showScaffoldMessenger(context: context, message: "No User Found for that email", color: kPrimaryColor);
    }
  }
}