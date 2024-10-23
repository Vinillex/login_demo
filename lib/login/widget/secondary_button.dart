import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.text,
    required this.onTap,
    super.key,
  });
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFFAFA2C3),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Center(
          child: AutoSizeText(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3E334E),
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
