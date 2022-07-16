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
          shadows: [
            BoxShadow(
              offset: Offset(-1, -1),
              blurRadius: 5,
              color: Colors.black38,
            ),
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 5,
              color: Colors.black38,
            ),
          ]),
    );
  }
}
