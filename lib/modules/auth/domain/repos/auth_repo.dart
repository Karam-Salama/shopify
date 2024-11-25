import 'package:dartz/dartz.dart';

import '../../data/models/user_creation_request.dart';
import '../../data/models/user_signIn_request.dart';

abstract class AuthRepo {
  Future<Either> signUp(UserCreationRequest userCreationRequest);
  Future<Either> signIn(UserSigninRequest userSigninRequest);
  Future<Either> signInWithGoogle();
  Future<Either> signInWithFacebook();
  Future<Either> signInWithApple();
  Future<Either> sendPasswordResetEmail(String email);
}