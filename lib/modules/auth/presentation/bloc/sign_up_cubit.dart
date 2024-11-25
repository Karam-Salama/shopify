import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/modules/auth/domain/usecases/signUp.dart';
import '../../data/models/user_creation_request.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.usecase) : super(AuthInitial());
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  AutovalidateMode signUpAutoValidateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = false;
  bool? isTermsAndConditionsAccepted = false;

  SignupUsecase usecase;

  void updateTermsAndConditionsCheckbox({required bool newValue}) {
    isTermsAndConditionsAccepted = newValue;
    emit(UpdateTermsAndConditionsState());
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String firstName, String lastName) async {
    emit(SignUpLoadingState());
    try {
      Either result = await usecase.call(
          params: UserCreationRequest(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password));
      result.fold(
        (error) {
          emit(SignUpErrorState(errorMessage: error));
        },
        (data) {
          emit(SignUpSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(SignUpErrorState(errorMessage: "${e.toString()}, try again later"));
    }
  }
}
