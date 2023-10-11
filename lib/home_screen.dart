import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/cover.dart';
import 'layout/section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(
                children: [Appbar(), Cover(), Sections()],
              ),
            ),
          ),
        ));
  }
}
