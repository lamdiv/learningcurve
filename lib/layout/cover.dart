import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  const Cover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: double.infinity,
      child: ClipRRect(
        child: Image.asset(
          'assets/banner.png',
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
