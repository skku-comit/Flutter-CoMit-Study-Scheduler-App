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
            TextField(
              decoration: InputDecoration(
                hintText: '이메일',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                hintText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              // onTap: (() => Get.to(HomePage())),
              onTap: () => null,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Color(0XFF4A4A4A),
                ),
                width: double.infinity,
                height: 50.h,
                child: Container(
                  alignment: Alignment.center,
                  child: Text('로그인',
                      style:
                          TextStyle(fontSize: 20.sp, color: Color(0XFFFFFFFF))),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Color(0XFF4A4A4A),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '또는',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0XFF4A4A4A),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Color(0XFF4A4A4A),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // InkWell(
            //   onTap: () async {},
            //   child: Ink(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50.r),
            //       color: Color(0XFFFEE500),
            //     ),
            //     width: double.infinity,
            //     height: 50.h,
            //     child: Container(
            //       alignment: Alignment.center,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SvgPicture.asset(
            //             'assets/logos/kakao-logo.svg',
            //             width: 25.w,
            //             height: 25.h,
            //           ),
            //           SizedBox(width: 10.w),
            //           Text('카카오 로그인',
            //               style: TextStyle(
            //                   fontSize: 20.sp, color: Color(0xD9000000))),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.h),
            // google login
            InkWell(
              onTap: () => controller.googleSignIn(),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.white,
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
            SizedBox(height: 10.h),
            // apple login
            InkWell(
              onTap: () => controller.appleSignIn(),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.black,
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
