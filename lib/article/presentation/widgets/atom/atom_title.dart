import 'package:flutter/material.dart';

class AtomTitle extends StatelessWidget {
  const AtomTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 80,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
