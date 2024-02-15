import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly/features/auth/manager/auth_even.dart';
import 'package:bookly/features/auth/manager/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? loginPassword, loginEmail;
  AutovalidateMode autovalidateModeLogin = AutovalidateMode.disabled;
  final GlobalKey<FormState> formLoginKey = GlobalKey();
  final GlobalKey<FormState> formRegisterkey = GlobalKey();
  AutovalidateMode autovalidateModeRegister = AutovalidateMode.disabled;
  String? registerEmail;
  String? registerPassword;

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        try {
          emit(LoginLoadingState());
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: loginEmail!,
            password: loginPassword!,
          );
          await saveUserToken(userCredential.user?.uid);
          log('saved');
          emit(LoginSuccessState());
        } on FirebaseAuthException catch (e) {
          emit(LoginErrorState(errorMassage: e.message.toString()));
          log(e.toString());
        } catch (e) {
          emit(LoginErrorState(errorMassage: e.toString()));
          log(e.toString());
        }
      } else if (event is ValidateLogin) {
        emit(FormLoginNotVlidate());
        if (formLoginKey.currentState!.validate()) {
          emit(FormLoginVlidate());
          formLoginKey.currentState!.save();
          add(LoginEvent());
        } else {
          autovalidateModeLogin = AutovalidateMode.always;
        }
      } else if (event is ValidateRegeiseter) {
        emit(FormNotVlidateRegister());
        if (formRegisterkey.currentState!.validate()) {
          emit(FormVlidateRegsister());
          formRegisterkey.currentState!.save();
          add(Regeiseter());
        } else {
          autovalidateModeRegister = AutovalidateMode.always;
        }
      } else if (event is Regeiseter) {
        try {
          emit(RegisterLoadingState());
          final userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: registerEmail!,
            password: registerPassword!,
          );
          await saveUserToken(userCredential.user?.uid);

          emit(RegisterSuccessState());
        } on FirebaseAuthException catch (e) {
          emit(RegisterErrorState(errorMassage: e.message!));
        } catch (e) {
          emit(RegisterErrorState(errorMassage: e.toString()));
        }
      }
    });
  }

  Future<void> saveUserToken(String? userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', userId ?? '');
  }

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }
}
