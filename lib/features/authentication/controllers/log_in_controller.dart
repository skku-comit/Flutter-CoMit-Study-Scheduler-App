import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

import '../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
  }

  /// Google Sign In Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save Authenticated user data in Firebase Firestore
      await userController.saveUserRecord(userCredentials: userCredentials);

      // Redirect
      await AuthenticationRepository.instance
          .screenRedirect(userCredentials?.user);
    } catch (e) {
      print(e);
    }
  }

  /// Apple Sign In Authentication
  Future<void> appleSignIn() async {
    try {
      // Start Loading

      // Apple Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithApple();

      // Save Authenticated user data in Firebase Firestore
      await userController.saveUserRecord(userCredentials: userCredentials);

      // Redirect
      await AuthenticationRepository.instance
          .screenRedirect(userCredentials?.user);
    } catch (e) {
      print(e);
    }
  }
}
