part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}


final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}

final class SignInSocialInitial extends SignInState {}

final class SignInSocialLoadingState extends SignInState {}

final class SignInSocialSuccessState extends SignInState {}

final class SignInSocialErrorState extends SignInState {
  final String errorMessage;
  SignInSocialErrorState({required this.errorMessage});
}


final class ObscurePasswordTextUpdateState extends SignInState {}