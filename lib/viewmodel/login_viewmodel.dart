import 'package:flutter_comit_study_scheduler_app/model/social_login_model.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginViewModel extends GetxController {
  final SocialLoginModel _socialLoginModel;
  bool isLogined = false;
  User? user;

  LoginViewModel(this._socialLoginModel);

  Future<void> login() async {
    isLogined = await _socialLoginModel.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future<void> logout() async {
    await _socialLoginModel.logout();
    isLogined = false;
    user = null;
  }
}
