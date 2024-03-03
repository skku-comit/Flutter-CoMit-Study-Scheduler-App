import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/authentication/screens/login/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndex,
              children: [
                OnBoardingPage(),
                OnBoardingPage2(),
                OnBoardingPage3(),
              ],
            ),
            Positioned(
              bottom: 20.h,
              right: 0,
              child: ElevatedButton(
                onPressed: () {
                  OnBoardingController.instance.nextPage();
                },
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
