import 'package:flutter/material.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('App Information'),
                  Text('Version: 1.0.0'),
                  Text('Developer: John Doe'),
                ],
              )),
        ));
  }
}
