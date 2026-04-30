import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spend_wise/repo/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  AuthCubit(this.repo) : super(AuthInitial());

//login
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return emit(AuthError(error: "Empty Input"));
    }

    emit(AuthLoading());

    try {
      await repo.login(email, password);
      emit(AuthSuccess());
    }
    // on to catch perticular error like here errors from FirebaseAuthException
    on FirebaseAuthException catch (error) {
      log(error.message ?? "Something went wrong", name: "AuthCubit");
      log("firebase auth exception");
      log(error.code);
      emit(AuthError(error: error.message ?? "Login Failed"));
    }
    //catch for all the errors
    catch (error) {
      log("catch exception");
      emit(AuthError(error: "Something went wrong"));
    }
  }
}
