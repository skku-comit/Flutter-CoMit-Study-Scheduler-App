import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/features/authentication/screens/login/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Container(
        child: Column(
          children: [
            Image(image: AssetImage('assets/logos/comit-logo.jpeg')),
            ElevatedButton(
              onPressed: () {
                toLoginPage();
              },
              child: Text('Go to Login Page'),
            ),
          ],
        ),
      ),
    );
  }
}

void toLoginPage() {
  final userStorage = GetStorage();
  userStorage.write('isFirstTime', false);

  Get.to(() => LoginPage());
}
