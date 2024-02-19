import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/user/user_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  /// init user data when Home Screen appears
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {}
  }

  /// Save user record from any Registration or Login
  Future<void> saveUserRecord(
      {UserModel? user, UserCredential? userCredentials}) async {
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // if no record already stored
      if (this.user.value.id.isEmpty) {
        if (userCredentials != null) {
          final newUser = UserModel(
            id: userCredentials.user!.uid,
            username: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
          );
          // Save user data in Firestore
          await userRepository.saveUserRecord(newUser);

          // Assign new user to the RxUser so that we can use it throughout the app
          this.user(newUser);
        } else if (user != null) {
          // Save Model in Firestore
          await userRepository.saveUserRecord(user);

          // Assign new user to the RxUser so that we can use it throughout the app
          this.user(user);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Logout Loader Function
  logout() {
    try {
      Get.defaultDialog(
          title: '로그아웃',
          middleText: '로그아웃 하시겠습니까?',
          confirm: ElevatedButton(
            child: Text('확인'),
            onPressed: () async {
              onClose();

              /// On Confirmation show any loader until the user is logged out
              Get.defaultDialog(
                title: '',
                barrierDismissible: false,
                backgroundColor: Colors.transparent,
                content: CircularProgressIndicator(),
              );
              await AuthenticationRepository.instance.logout();
            },
          ),
          cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text('취소'),
          ));
    } catch (e) {
      print(e);
    }
  }
}
