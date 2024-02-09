// import 'package:flutter_comit_study_scheduler_app/model/social_login_model.dart';
// import 'package:get/get.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

// class LoginViewModel extends GetxController {
//   final SocialLoginModel _socialLoginModel;
//   RxBool isLogined = false.obs;
//   Rx<User?> user = Rx<User?>(null);

//   LoginViewModel(this._socialLoginModel);

//   Future<void> login() async {
//     bool loginResult = await _socialLoginModel.login();
//     if (loginResult) {
//       isLogined.value = true;
//       user.value = await UserApi.instance.me();
//     }
//   }

//   Future<void> logout() async {
//     await _socialLoginModel.logout();
//     isLogined.value = false;
//     user.value = null;
//   }
// }
