import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/view/calendar_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/home_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/login_page.dart';
import 'package:flutter_comit_study_scheduler_app/view/widgets/custom_navigation_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomNavigationBar();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
