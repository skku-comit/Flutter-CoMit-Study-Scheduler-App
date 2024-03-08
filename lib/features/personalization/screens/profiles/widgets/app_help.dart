import 'package:flutter/material.dart';

class AppHelp extends StatelessWidget {
  const AppHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Help'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('App Help'),
          ],
        )));
  }
}
