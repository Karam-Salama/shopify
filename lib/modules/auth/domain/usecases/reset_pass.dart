// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../repos/auth_repo.dart';

class ResetPassUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<AuthRepo>().sendPasswordResetEmail(params!);
  }
  
}