import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/profile/get_current_user_cubit.dart';
import 'package:grad/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/register_button.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/wave_clipper.dart';
import 'package:grad/models/users/user_model.dart';
import 'package:grad/screens/login_signup_forgetpass_screens/login.dart';
import '../../constants/constant.dart';
import 'Sign_up_clipper_text.dart';
import 'custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController nameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController bloodTypeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    cityController.dispose();
    bloodTypeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: const SignUpClipperText(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.01),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.02),
                    child: Text(
                      "Donor/Recipient Sign-up",
                      style: TextStyle(
                        fontSize: screenWidth *
                            0.065, // Adjusted based on screen width
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff3e3d3b),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01,
              ),
              child: Column(
                children: [
                  CustomTextFormField(
                    screenWidth: screenWidth,
                    controller: nameController,
                    inputType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.account_box,
                      color: Color(0xff81201a),
                    ),
                    hintText: "User Name",
                    validator: (value) {
                      if (value!.isEmpty && !value.contains(" ")) {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  //RowCityBloodType(screenWidth: screenWidth, cityController: cityController, cityAndBloodTypeWidth: cityAndBloodTypeWidth, bloodTypeController: bloodTypeController),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          errorText: "Invalid Data",
                          screenWidth: screenWidth,
                          controller: cityController,
                          inputType: TextInputType.name,
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: kPrimaryColor,
                          ),
                          hintText: "City",
                          validator: (value) {
                            if (value!.isEmpty && !value.contains(" ")) {
                              return "Invalid Data";
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          errorText: "Invalid Data",
                          screenWidth: screenWidth,
                          controller: bloodTypeController,
                          inputType: TextInputType.name,
                          prefixIcon: const Icon(
                            Icons.bloodtype,
                            color: kPrimaryColor,
                          ),
                          hintText: "Blood Type",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Blood type must not be empty";
                            } else if (!RegExp(r'^(A|B|AB|O)[+-]$').hasMatch(value)) {
                              return "Use A+, B-, AB+, O-, etc.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    screenWidth: screenWidth,
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    prefixIcon:
                        const Icon(Icons.mark_email_read, color: kPrimaryColor),
                    hintText: "E-mail",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Can't Be Empty";
                      } else if (!EmailValidator.validate(value)) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    screenWidth: screenWidth,
                    controller: passwordController,
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    inputType: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    prefixIcon: const Icon(Icons.lock, color: kPrimaryColor),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryColor,
                      ),
                    ),
                    hintText: "Password",
                    validator: (password) {
                      return validatePassword(password!);
                    },
                  ),
                  CustomTextFormField(
                    screenWidth: screenWidth,
                    controller: numberController,
                    inputType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone, color: kPrimaryColor),
                    hintText: "Number",
                    validator: (value) {
                      // Check if the value is empty
                      if (value!.isEmpty) {
                        return "Number must not be empty";
                      }
                      // Check if the value is exactly 11 digits and starts with "01"
                      else if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
                        return "Number must start with '01' and be 11 digits long";
                      }
                      return null;
                    },
                  ),

                  BlocListener<SignUpCubit, SignUpState>(
                    listener: (BuildContext context, state) {
                      if (state is SignUpSuccess) {
                        showScaffoldMessenger(
                          context: context,
                          message: "Created Email Successfully !",
                          color: Colors.green,
                        );
                        BlocProvider.of<SignUpCubit>(context).addUser(
                          UserModel(
                            password: passwordController.text,
                            location: cityController.text,
                            bloodType: bloodTypeController.text,
                            email: emailController.text,
                            name: nameController.text,
                            photoUrl: numberController.text,
                            isSaved: false,
                          ),
                        );
                      } else if (state is SignUpFailure) {
                        if (state.errMessage.contains("email-already-in-use")) {
                          showScaffoldMessenger(
                            context: context,
                            message: "This email is already in use",
                            color: kPrimaryColor,
                          );
                        }
                      } else if (state is SignUpFailure) {
                        showScaffoldMessenger(
                          context: context,
                          message: "Failed to Sign Up",
                          color: Colors.red,
                        );
                      }
                    },
                    child: RegisterButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<SignUpCubit>(context).signupUser(
                            context,
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.039,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: const Color(0xff81201a),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.039,
                    ),
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
