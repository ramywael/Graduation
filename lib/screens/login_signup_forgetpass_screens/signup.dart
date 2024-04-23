import 'package:flutter/material.dart';
import 'package:grad/screens/home/user_home_page.dart';
import '../../constants/constant.dart';
import '../../custom_widgets/login_and_signup_screens/custom_button.dart';
import '../../custom_widgets/login_and_signup_screens/custom_text_form_field.dart';
import '../../custom_widgets/login_and_signup_screens/wave_clipper.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var nameController = TextEditingController();
  var cityController = TextEditingController();
  var bloodTypeController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff81201a),
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: const SignUpClipperText(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
                child: Row(
                  children: [
                     Padding(
                      padding:  EdgeInsets.only(left: screenHeight * 0.02),
                      child: Text(
                        "Donor/Recipient Sign-up",
                        style: TextStyle(
                            fontSize: screenWidth * 0.065,  // Adjusted based on screen width
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff3e3d3b)),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.024,),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      inputType: TextInputType.name,
                      prefixIcon: const Icon(
                        Icons.account_box,
                        color: Color(0xff81201a),
                      ),
                      labelName: "Full Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name must not be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                      child: Row(
                        children: [
                          Card(
                            shape: const CircleBorder(eccentricity: 1),
                            child: Container(
                              height: screenWidth * 0.12,  // Adjusted based on screen width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(screenWidth * 0.06),  // Adjusted based on screen width
                                boxShadow: kBoxShadow,
                              ),
                              child: SizedBox(
                                width: screenWidth * 0.35,  // Adjusted based on screen width
                                child: TextFormField(
                                  controller: cityController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(screenWidth * 0.05),  // Adjusted based on screen width
                                        borderSide: BorderSide.none),
                                    prefixIcon: const Icon(
                                      Icons.add_location_alt_sharp,
                                      color: Color(0xff81201a),
                                    ),
                                    label:  Text(
                                      "City",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.045,  // Adjusted based on screen width
                                          color: Colors.grey),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Write your City";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Card(
                            shape: const CircleBorder(eccentricity: 1),
                            child: Container(
                              height: screenWidth * 0.12,  // Adjusted based on screen width
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(screenWidth * 0.06),  // Adjusted based on screen width
                                boxShadow: kBoxShadow,
                              ),
                              child: SizedBox(
                                width: screenWidth * 0.4,  // Adjusted based on screen width
                                child: TextFormField(
                                  controller: bloodTypeController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(screenWidth * 0.05),  // Adjusted based on screen width
                                        borderSide: BorderSide.none),
                                    prefixIcon: const Icon(
                                      Icons.bloodtype,
                                      color: Color(0xff81201a),
                                    ),
                                    label:  Text(
                                      "Blood Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.045,  // Adjusted based on screen width
                                          color: Colors.grey),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Write your Blood Type";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.mark_email_read,
                          color: Color(0xff81201a)),
                      labelName: "E-mail",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "E-mail must not be empty";
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
                      prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff81201a)
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xff81201a),
                        ),
                      ),
                      labelName: "Password",
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password must not be empty";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: numberController,
                      inputType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone, color: Color(0xff81201a)),
                      labelName: "Number",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Number must not be empty";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09,vertical: screenHeight * 0.01),
                      child: CustomButton(
                        buttonText: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                             formKey.currentState!.save();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
