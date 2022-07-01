import 'package:flutter/material.dart';

class AtomLoginText extends StatelessWidget {
  const AtomLoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
