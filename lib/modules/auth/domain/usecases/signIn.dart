// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:shopify/modules/auth/data/models/user_signIn_request.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../repos/auth_repo.dart';

class SignInUsecase implements Usecase<Either, UserSigninRequest> {
  @override
  Future<Either> call({UserSigninRequest? params}) async {
    return await getIt<AuthRepo>().signIn(params!);
  }
  
}