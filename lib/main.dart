import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/view/home_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/register_page.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: 'f2ad9647c357bde4bf6e159a4f10ec61');
  // runApp(MyApp());
  runApp(PlatformApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), // iPhone 14 Pro
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Study Scheduler',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomePage(),
        // home: LoginPage(),
        home: RegisterPage(),
      ),
    );
  }
}
