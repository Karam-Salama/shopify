import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/user_creation_request.dart';
import '../models/user_signIn_request.dart';
import 'dart:math' as math;

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationRequest userCreationRequest);
  Future<Either> signIn(UserSigninRequest userSigninRequest);
  Future<Either> signInWithGoogle();
  Future<Either> signInWithFacebook();
  Future<Either> signInWithApple();
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImplement implements AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationRequest userCreationRequest) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userCreationRequest.email!,
        password: userCreationRequest.password!,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .doc(returnedData.user!.uid)
          .set(
        {
          'fullName':
              '${userCreationRequest.firstName} ${userCreationRequest.lastName}',
          'firstName': userCreationRequest.firstName,
          'lastName': userCreationRequest.lastName,
          'email': userCreationRequest.email,
          'uId': returnedData.user!.uid
        },
      );

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signIn(UserSigninRequest userSigninRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSigninRequest.email!,
        password: userSigninRequest.password!,
      );
      return const Right('Sign In was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return const Right('Sign In was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'account-exists-with-different-credential') {
        message = 'يوجد حساب بالفعل بهذا البريد الإلكتروني.';
      } else if (e.code == 'invalid-credential' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        message = 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.';
      } else if (e.code == 'user-disabled') {
        message = 'حسابك معطل.';
      } else if (e.code == 'network-request-failed') {
        message = 'يرجى التحقق من الاتصال بالانترنت.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return const Right('Sign In was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'account-exists-with-different-credential') {
        message = 'يوجد حساب بالفعل بهذا البريد الإلكتروني.';
      } else if (e.code == 'invalid-credential' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        message = 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.';
      } else if (e.code == 'user-disabled') {
        message = 'حسابك معطل.';
      } else if (e.code == 'network-request-failed') {
        message = 'يرجى التحقق من الاتصال بالانترنت.';
      }
      return Left(message);
    }
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<Either> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return const Right('Sign In was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'account-exists-with-different-credential') {
        message = 'يوجد حساب بالفعل بهذا البريد الإلكتروني.';
      } else if (e.code == 'invalid-credential' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        message = 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.';
      } else if (e.code == 'user-disabled') {
        message = 'حسابك معطل.';
      } else if (e.code == 'network-request-failed') {
        message = 'يرجى التحقق من الاتصال بالانترنت.';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Email sent successfully');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.';
      } else if (e.code == 'network-request-failed') {
        message = 'يرجى التحقق من الاتصال بالانترنت.';
      }
      return Left(message);
    }
  }
}
