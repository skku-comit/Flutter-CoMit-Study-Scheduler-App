import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/authentication/controllers/log_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Study Scheduler',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Image(
              image: AssetImage('assets/logos/comit-logo.png'),
              height: 200.h,
              width: 200.w,
            ),

            SizedBox(height: 20.h),
            InkWell(
              onTap: () => controller.googleSignIn(),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/logos/google-logo.png'),
                          width: 25.w,
                          height: 25.h,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        'Google로 계속하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xD9000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // apple login
            InkWell(
              onTap: () => controller.appleSignIn(),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/logos/apple-logo.png'),
                          width: 25.w,
                          height: 25.h,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        'Apple로 계속하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
