// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:shopify/core/usecase/usecase.dart';
import 'package:shopify/modules/auth/data/models/user_creation_request.dart';

import '../../../../core/services/service_locator.dart';
import '../repos/auth_repo.dart';

class SignupUsecase implements Usecase<Either,UserCreationRequest> {
  @override
  Future<Either> call({UserCreationRequest? params}) async {
    return await getIt<AuthRepo>().signUp(params!);
  }

}