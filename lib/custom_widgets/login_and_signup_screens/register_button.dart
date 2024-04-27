import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'custom_button_connection.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.onPressed,
  });

  final double screenWidth;
  final double screenHeight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.09,
        vertical: screenHeight * 0.015,
      ),
      child: BlocBuilder<SignUpCubit,SignUpState>(
        builder: (context, state) {
          return CustomButtonConnection(
            isLoading: state is SignUpLoading,
            buttonText: 'Register',
            onPressed: onPressed,
          );
        },
      )
    );
  }
}
