part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginUserEvent extends LoginEvent {
  LoginUserEvent(this.email, this.password);
  final String email;
  final String password;
}

final class GetLoginStatus extends LoginEvent {}

final class LogoutEvent extends LoginEvent {}


