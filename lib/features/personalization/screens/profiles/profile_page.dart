import 'package:flutter/material.dart';
import 'package:flutter_comit_study_scheduler_app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

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
              AuthService().signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${AuthService().getCurrentUserDisplayName()}'),
          ],
        ),
      ),
    );
  }
}
