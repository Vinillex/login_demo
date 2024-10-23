import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/home/view/home_screen.dart';
import 'package:login_ui/login/bloc/login_bloc.dart';
import 'package:login_ui/login/view/desktop.dart';
import 'package:login_ui/login/view/tablet.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) {
              return route.isFirst;
            });
          }
        },
        child: Form(
          key: _formKey,
          child: Scaffold(
            body: (ResponsiveBreakpoints.of(context).largerThan(TABLET))
                ? Desktop(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _loginBloc.add(
                          LoginUserEvent(
                            _emailController.text,
                            _passwordController.text,
                          ),
                        );
                      }
                    },
                  )
                : Tablet(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _loginBloc.add(
                          LoginUserEvent(
                            _emailController.text,
                            _passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
