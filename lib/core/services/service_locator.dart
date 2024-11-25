import 'package:get_it/get_it.dart';
import 'package:shopify/modules/auth/domain/repos/auth_repo.dart';

import '../../modules/auth/data/repos/auth_repo_implement.dart';
import '../../modules/auth/data/sources/auth_firebase_service.dart';
import '../../modules/auth/domain/usecases/reset_pass.dart';
import '../../modules/auth/domain/usecases/signIn.dart';
import '../../modules/auth/domain/usecases/signUp.dart';
import '../../modules/auth/domain/usecases/social_signIn.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // services
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImplement());

  // repositories
  getIt.registerSingleton<AuthRepo>(AuthRepoImplement());

  // usecases
  getIt.registerSingleton<SignupUsecase>(SignupUsecase());
  getIt.registerSingleton<SignInUsecase>(SignInUsecase());
  getIt.registerSingleton<SocialAuthUsecase>(SocialAuthUsecase());
  getIt.registerSingleton<ResetPassUsecase>(ResetPassUsecase());
  
}
