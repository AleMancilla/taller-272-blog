import 'package:flutter/material.dart';

class AtomTextTitle extends StatelessWidget {
  const AtomTextTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
