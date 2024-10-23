import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          color: ResponsiveBreakpoints.of(context).largerThan(TABLET)
              ? Colors.black
              : Colors.white,
          width: ResponsiveBreakpoints.of(context).equals('SD') ? 25 : 50,
        ),
        const SizedBox(
          width: 20,
        ),
        AutoSizeText(
          'Design Guild',
          style: TextStyle(
            fontSize: ResponsiveBreakpoints.of(context).equals('SD') ? 20 : 32,
            fontWeight: FontWeight.w600,
            color: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                ? Colors.black
                : Colors.white,
          ),
        ),
      ],
    );
  }
}
