import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/login/login_page.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  Rx<int> currentPageIndex = 0.obs;
  final pageController = PageController();

  void updatePageIndex(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final userStorage = GetStorage();
      userStorage.write('isFirstTime', false);

      Get.to(() => LoginPage());
    } else {
      int page = currentPageIndex.value + 1;

      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
