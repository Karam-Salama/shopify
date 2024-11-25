import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_signIn_request.dart';
import '../../domain/usecases/signIn.dart';
import '../../domain/usecases/social_signIn.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.usecase , this.socialAuthUsecase) : super(SignInInitial());
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  AutovalidateMode signInAutoValidateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = false;
  SignInUsecase usecase;
  SocialAuthUsecase socialAuthUsecase;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      Either result = await usecase.call(
          params: UserSigninRequest(email: email, password: password));
      result.fold(
        (error) {
          emit(SignInErrorState(errorMessage: error));
        },
        (data) {
          emit(SignInSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(SignInErrorState(errorMessage: "${e.toString()}, try again later"));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInSocialLoadingState());
    try {
      Either result = await socialAuthUsecase.callWithGoogle();
      result.fold(
        (error) {
          emit(SignInSocialErrorState(errorMessage: error));
        },
        (data) {
          emit(SignInSocialSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(SignInSocialErrorState(
          errorMessage: "${e.toString()}, try again later"));
    }
  }

  Future<void> signInWithFacebook() async {
    emit(SignInSocialLoadingState());
    try {
      Either result = await socialAuthUsecase.callWithFacebook();
      result.fold(
        (error) {
          emit(SignInSocialErrorState(errorMessage: error));
        },
        (data) {
          emit(SignInSocialSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(SignInSocialErrorState(
          errorMessage: "${e.toString()}, try again later"));
    }
  }

  Future<void> signInWithApple() async {
    emit(SignInSocialLoadingState());
    try {
      Either result = await socialAuthUsecase.callWithApple();
      result.fold(
        (error) {
          emit(SignInSocialErrorState(errorMessage: error));
        },
        (data) {
          emit(SignInSocialSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(SignInSocialErrorState(
          errorMessage: "${e.toString()}, try again later"));
    }
  }
}
