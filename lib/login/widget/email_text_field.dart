import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/login/widget/custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AutoSizeText(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        CustomTextField(
          controller: controller,
          hintText: 'Enter your email',
          validator: (value) {
            if (value == null) {
              return 'Please enter your email';
            }
            final regex = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            );
            if (value.isEmpty) {
              return 'Please enter your email';
            } else {
              if (!regex.hasMatch(value)) {
                return 'Enter valid email';
              } else {
                return null;
              }
            }
          },
          showObscured: false,
        ),
        const Spacer(),
      ],
    );
  }
}
