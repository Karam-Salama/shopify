import 'package:dartz/dartz.dart';

import 'package:shopify/modules/auth/data/models/user_creation_request.dart';
import 'package:shopify/modules/auth/data/models/user_signIn_request.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/repos/auth_repo.dart';
import '../sources/auth_firebase_service.dart';

class AuthRepoImplement extends AuthRepo {
  @override
  Future<Either> signUp(UserCreationRequest userCreationRequest) async {
    return await getIt<AuthFirebaseService>().signUp(userCreationRequest);
  }

  @override
  Future<Either> signIn(UserSigninRequest userSigninRequest) async {
    return await getIt<AuthFirebaseService>().signIn(userSigninRequest);
  }

  @override
  Future<Either> signInWithGoogle() async {
    return await getIt<AuthFirebaseService>().signInWithGoogle();
  }

  @override
  Future<Either> signInWithFacebook() async {
    return await getIt<AuthFirebaseService>().signInWithFacebook();
  }

  @override
  Future<Either> signInWithApple() async {
    return await getIt<AuthFirebaseService>().signInWithApple();
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) {
    return getIt<AuthFirebaseService>().sendPasswordResetEmail(email);
  }
}
