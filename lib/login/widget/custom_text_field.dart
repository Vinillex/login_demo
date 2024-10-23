import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    required this.hintText,
    required this.showObscured,
    required this.validator,
    super.key,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final bool showObscured;

  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (context, value, child) {
        return TextFormField(
          validator: validator,
          controller: controller,
          scrollPadding: EdgeInsets.zero,
          obscureText: value,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            border: const OutlineInputBorder(),
            suffix: showObscured
                ? InkWell(
                    onTap: () {
                      _valueNotifier.value = !_valueNotifier.value;
                    },
                    child: const Icon(
                      Icons.visibility,
                      size: 15,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
