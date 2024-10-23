import 'package:flutter/widgets.dart';
import 'package:login_ui/login/widget/auth_widget.dart';
import 'package:login_ui/login/widget/email_text_field.dart';
import 'package:login_ui/login/widget/password_text_field.dart';
import 'package:login_ui/login/widget/primary_button.dart';
import 'package:login_ui/login/widget/special_mobile_header.dart';

class Tablet extends StatelessWidget {
  const Tablet(
      {required this.emailController, required this.passwordController, required this.onTap, super.key,});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 250,
            child: SpecialMobileHeader(),
          ),
          Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Column(
              children: [
                const AuthWidget(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: EmailTextField(controller: emailController),
                ),
                SizedBox(
                  height: 100,
                  child: PasswordTextField(
                    controller: passwordController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: 'Login',
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
