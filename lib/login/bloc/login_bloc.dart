import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:login_ui/util/constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(_loginUser);
    on<GetLoginStatus>(_getStatus);
    on<LogoutEvent>(_logout);
  }

  Future<void> _loginUser(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    // var emailBytes = utf8.encode(event.email);
    // var passwordBytes = utf8.encode(event.password);

    // var emailDigest = sha1.convert(emailBytes);
    // var passwordDigest = sha1.convert(passwordBytes);

    // const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    // final key = Key.fromUtf8('my 32 length key................');
    // final iv = IV.fromLength(16);

    // final encrypter = Encrypter(AES(key));

    // final encrypted = encrypter.encrypt(plainText, iv: iv);
    // final decrypted = encrypter.decrypt(encrypted, iv: iv);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.emailKey, event.email);
    await prefs.setString(Constants.passwordKey, event.password);
    emit(LoginSuccess());
  }

  Future<void> _getStatus(
    GetLoginStatus event,
    Emitter<LoginState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(Constants.emailKey);
    if (email != null) {
      emit(AuthorizedState());
    } else {
      emit(UnAuthorizedState());
    }
  }

  Future<void> _logout(
    LogoutEvent event,
    Emitter<LoginState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.emailKey);
  }
}
