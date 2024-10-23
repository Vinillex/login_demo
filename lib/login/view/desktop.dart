import 'package:flutter/widgets.dart';
import 'package:login_ui/login/widget/auth_widget.dart';
import 'package:login_ui/login/widget/email_text_field.dart';
import 'package:login_ui/login/widget/password_text_field.dart';
import 'package:login_ui/login/widget/primary_button.dart';
import 'package:login_ui/login/widget/recent_login.dart';
import 'package:login_ui/login/widget/title_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Desktop extends StatelessWidget {
  const Desktop({
    required this.emailController,
    required this.passwordController,
    required this.onTap,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).equals('SD') ? 50 : 150,
                ),
                const TitleWidget(),
                const Spacer(),
                Expanded(
                  flex: ResponsiveBreakpoints.of(context).equals('SD') ? 3 : 2,
                  child: EmailTextField(
                    controller: emailController,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: ResponsiveBreakpoints.of(context).equals('SD') ? 3 : 2,
                  child: PasswordTextField(
                    controller: passwordController,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: ResponsiveBreakpoints.of(context).equals('SD') ? 2 : 1,
                  child: PrimaryButton(
                    text: 'Login',
                    onTap: onTap,
                  ),
                ),
                SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).equals('SD') ? 50 : 150,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: Row(
              children: [
                SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).equals('SD') ? 50 : 150,
                ),
                Expanded(
                  flex: ResponsiveBreakpoints.of(context).equals('SD') ? 4 : 2,
                  child: RecentLogin(),
                ),
                const Spacer(),
                Expanded(
                  flex: ResponsiveBreakpoints.of(context).equals('SD') ? 4 : 2,
                  child: const AuthWidget(),
                ),
                SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).equals('SD') ? 50 : 150,
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFB6564),
                  Color(0xFFA03CEA),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
