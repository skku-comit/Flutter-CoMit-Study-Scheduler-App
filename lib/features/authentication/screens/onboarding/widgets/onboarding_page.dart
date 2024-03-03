import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/onboarding_controller.dart';
import '../onboarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logos/comit-logo.png'),
          width: 200.w,
          height: 200.h,
        ),
        SizedBox(height: 20.h),
        Text(
          'Welcome to Comit Study Scheduler',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          '모든 학생들이 다양한 사람들과 교류하고 협력하며 즐겁게 코딩을 할 수 있는 환경을 만들기 위해 노력하는 성균관대학교 중앙 코딩 동아리 CoMit 입니다.',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/study-list.png'),
          height: 400.h,
        ),
        SizedBox(height: 20.h),
        Text(
          'CoMit 동아리의 스터디 정보를 확인해 보세요!',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          'CoMit 동아리에서는 웹개발, 앱개발, 알고리즘 등 다양한 주제로 스터디를 진행하고 있습니다. 스터디 정보를 확인하고 참여해보세요!',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/reservation.png'),
          height: 400.h,
        ),
        SizedBox(height: 20.h),
        Text(
          'CoMit 동아리방을 예약해보세요!',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          'CoMit 동아리방은 학생회관 3층 03312에 위치해 있습니다. 동아리방을 예약하고 다양한 활동을 진행해보세요!',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
