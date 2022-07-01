import 'package:flutter/material.dart';

class AtomSubtitle extends StatelessWidget {
  const AtomSubtitle({Key? key, required this.subtitle}) : super(key: key);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
