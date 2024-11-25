import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/modules/auth/presentation/bloc/reset_pass_state.dart';

import '../../domain/usecases/reset_pass.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.usecase) : super(ResetPassInitial());
  String? emailAddress;
  GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  AutovalidateMode resetPassAutoValidateMode = AutovalidateMode.disabled;
  ResetPassUsecase usecase;

  Future<void> resetPass({String? params}) async {
    emit(ResetPassLoadingState());
    try {
      final result = await usecase(params: params);
      result.fold(
        (error) {
          emit(ResetPassErrorState(errorMessage: error));
        },
        (data) {
          emit(ResetPassSuccessState());
        },
      );
    } on Exception catch (e) {
      emit(ResetPassErrorState(
          errorMessage: "${e.toString()}, try again later"));
    }
  }
}
