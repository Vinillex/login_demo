import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/login/widget/custom_text_field.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AutoSizeText(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        CustomTextField(
          controller: controller,
          hintText: 'Enter your password with unique characters',
          validator: (value) {
            if (value == null) {
              return 'Please enter password';
            }
            const pattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            final regex = RegExp(
              pattern,
            );
            if (value.isEmpty) {
              return 'Please enter password';
            } else {
              if (!regex.hasMatch(value)) {
                return 'Enter valid password';
              } else {
                return null;
              }
            }
          },
          showObscured: true,
        ),
        Expanded(
          child: Align(
            alignment: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                ? Alignment.topLeft
                : Alignment.topRight,
            child: const AutoSizeText(
              'Forget Password?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
