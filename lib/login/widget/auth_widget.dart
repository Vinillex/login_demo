import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:login_ui/login/widget/primary_button.dart';
import 'package:login_ui/login/widget/secondary_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveBreakpoints.of(context).isMobile ? 280 : 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            'Join our \ncommunity today',
            style: TextStyle(
              fontSize: ResponsiveBreakpoints.of(context).isMobile ? 24 : 32,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
          ),
          AutoSizeText(
            'Get connected, find designers to start a project',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: ResponsiveBreakpoints.of(context).isMobile ? 14 : 20,
            ),
            maxLines: 2,
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Sign up',
            onTap: () {},
          ),
          SizedBox(
            height: ResponsiveBreakpoints.of(context).isMobile ? 10 : 20,
          ),
          const Align(
            child: AutoSizeText(
              'Or, login with',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveBreakpoints.of(context).isMobile ? 10 : 20,
          ),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  text: 'Facebook',
                  onTap: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SecondaryButton(
                  text: 'Linked In',
                  onTap: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SecondaryButton(
                  text: 'Google',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
