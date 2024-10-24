part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class AuthorizedState extends LoginState {}

final class UnAuthorizedState extends LoginState {}
