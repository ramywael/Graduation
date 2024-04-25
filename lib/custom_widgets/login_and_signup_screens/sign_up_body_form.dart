import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/register_button.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/row_fields_city_bloodtype_signup.dart';
import 'package:grad/custom_widgets/login_and_signup_screens/wave_clipper.dart';
import '../../constants/constant.dart';
import '../../screens/home/user_home_page.dart';
import 'Sign_up_clipper_text.dart';
import 'custom_button.dart';
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
    double cityAndBloodTypeWidth = screenWidth * 0.045;
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
                    controller: nameController,
                    inputType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.account_box,
                      color: Color(0xff81201a),
                    ),
                    labelName: "User Name",
                    validator: (value) {
                      if (value!.isEmpty && !value.contains(" ")) {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  RowCityBloodType(screenWidth: screenWidth, cityController: cityController, cityAndBloodTypeWidth: cityAndBloodTypeWidth, bloodTypeController: bloodTypeController),
                  CustomTextFormField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.mark_email_read,
                        color: kPrimaryColor),
                    labelName: "E-mail",
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
                    controller: passwordController,
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    inputType: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    prefixIcon:
                        const Icon(Icons.lock, color: kPrimaryColor),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility,
                        color:  kPrimaryColor,
                      ),
                    ),
                    labelName: "Password",
                    validator: (password) {
                      return validatePassword(password!);
                    },
                  ),
                  CustomTextFormField(
                    controller: numberController,
                    inputType: TextInputType.phone,
                    prefixIcon:
                        const Icon(Icons.phone, color: kPrimaryColor),
                    labelName: "Number",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Number must not be empty";
                      }else if(value.length >11)
                        {
                          return "Number must be 11 digits";
                        }
                      return null;
                    },
                  ),
                  RegisterButton(screenWidth: screenWidth, screenHeight: screenHeight, formKey: formKey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



