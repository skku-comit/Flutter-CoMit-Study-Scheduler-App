import 'package:flutter/material.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Information'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('App Information'),
          ],
        )));
  }
}
