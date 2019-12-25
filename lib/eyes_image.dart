import 'package:flutter/material.dart';

class EyesImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "/images/cartoon-eyes.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
