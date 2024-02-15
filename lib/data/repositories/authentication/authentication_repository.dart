import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_comit_study_scheduler_app/features/authentication/screens/login/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/utils/local_storage/storage_utility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../home.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  late final Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;

  /// Getters
  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => _firebaseUser.value?.uid ?? "";

  String get getUserEmail => _firebaseUser.value?.email ?? "";

  String get getDisplayName => _firebaseUser.value?.displayName ?? "";

  String get getPhoneNo => _firebaseUser.value?.phoneNumber ?? "";

  /// Called from main.dart on app launch
  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    screenRedirect(_firebaseUser.value);
  }

  /// Function to Show Relevant Screen
  screenRedirect(User? user) async {
    if (user != null) {
      if (user.emailVerified) {
        await LocalStorage.init(user.uid);
        Get.offAll(() => const Home());
      } else {
        Get.offAll(() => LoginPage());
      }
    } else {
      // Local Storage: User is new or Logged out! If new then write isFirstTime Local storage variable = true.
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginPage())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* ---------------------------- Firebase Authentication ---------------------------- */

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Get the Google Sign In Authentication
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      if (kDebugMode) print('Error: $e');
      return null;
    }
  }

  /// [AppleAuthentication] - APPLE
  Future<UserCredential?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      print('Apple ID: ${appleCredential.toString()}');

      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      if (kDebugMode) print('Error: $e');
      return null;
    }
  }

  /// [LogoutUser]
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// [DeleteUser]
  Future<void> deleteUser() async {
    try {
      await _firebaseUser.value!.delete();
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
