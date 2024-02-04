import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/model/kakao_login_model.dart';
import 'package:flutter_comit_study_scheduler_app/viewmodel/login_viewmodel.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final LoginViewModel viewModel = Get.put(LoginViewModel(KaKaoLoginModel()));

  @override
  Widget build(BuildContext context) {
    // Instantiate LoginViewModel
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              viewModel.logout().then((value) => Navigator.of(context).pop());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                  '${viewModel.user.value?.kakaoAccount?.profile?.nickname}');
            }),
          ],
        ),
      ),
    );
  }
}
