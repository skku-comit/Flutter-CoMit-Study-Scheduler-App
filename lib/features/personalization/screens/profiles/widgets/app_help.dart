import 'package:flutter/material.dart';

class AppHelp extends StatelessWidget {
  const AppHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text('App Help'),
                  Text('For help, please contact us at:'),
                ],
              )),
        ));
  }
}
