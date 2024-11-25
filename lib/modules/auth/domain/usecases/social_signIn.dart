// ignore_for_file: file_names

import '../../../../core/services/service_locator.dart';
import '../../domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SocialAuthUsecase {
  Future<Either> callWithGoogle() async {
    return await getIt<AuthRepo>().signInWithGoogle();
  }

  Future<Either> callWithFacebook() async {
    return await getIt<AuthRepo>().signInWithFacebook();
  }

  Future<Either> callWithApple() async {
    return await getIt<AuthRepo>().signInWithGoogle();
  }
}
