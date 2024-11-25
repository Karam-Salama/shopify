sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}


final class ResetPassLoadingState extends ResetPassState {}

final class ResetPassSuccessState extends ResetPassState {}

final class ResetPassErrorState extends ResetPassState {
  final String errorMessage;
  ResetPassErrorState({required this.errorMessage});
}