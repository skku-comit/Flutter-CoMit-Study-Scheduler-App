import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '회원가입',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호 확인',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {},
              child: Text('회원가입'),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
