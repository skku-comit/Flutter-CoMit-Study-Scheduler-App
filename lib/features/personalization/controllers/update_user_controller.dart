import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/data/repositories/user/user_repository.dart';
import 'package:flutter_comit_study_scheduler_app/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

class UpdateUserController extends GetxController {
  static UpdateUserController get instance => Get.find();

  final userName = TextEditingController();
  final email = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeUser();
    super.onInit();
  }

  Future<void> initializeUser() async {
    userName.text = userController.user.value.username;
    email.text = userController.user.value.email;
  }
}
