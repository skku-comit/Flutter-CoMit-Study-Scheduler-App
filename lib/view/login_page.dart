import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/main.dart';
import 'package:flutter_comit_study_scheduler_app/model/kakao_login_model.dart';
import 'package:flutter_comit_study_scheduler_app/view/home_page.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/login_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginviewModel = Get.put(LoginViewModel(KaKaoLoginModel()));

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                hintText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              // onTap: (() => Get.to(HomePage())),
              onTap: () => null,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
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
            InkWell(
              onTap: () async {
                await loginviewModel
                    .login()
                    .then((value) => Get.to(HomePage()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Color(0XFFFEE500),
                ),
                width: double.infinity,
                height: 50.h,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/kakao_logo.svg',
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(width: 10.w),
                      Text('카카오 로그인',
                          style: TextStyle(
                              fontSize: 20.sp, color: Color(0xD9000000))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
