import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Setting'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('User Setting'),
          ],
        )));
  }
}
