import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/cubits/internet_connection/internet_cubit.dart';
import 'package:grad/cubits/sign_up_cubit/sign_up_cubit.dart';
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, required this.buttonText, required this.onPressed});
//
//   final String buttonText;
//   final void Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 22),
//       child: SizedBox(
//         width: double.infinity,
//         height: 60,
//         child: MaterialButton(
//           onPressed: onPressed,
//           color: const Color(0xff81201a),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           child: Text(
//             buttonText,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 21,
//                 color: Colors.white
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButtonConnection extends StatelessWidget {
  const CustomButtonConnection(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPressed,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  screenWidth * 0.08)), // Adjusted border radius
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoading) {
                return SizedBox(
                  height: screenHeight * 0.02,
                  width: screenWidth * 0.08,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05, // Adjusted font size
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
