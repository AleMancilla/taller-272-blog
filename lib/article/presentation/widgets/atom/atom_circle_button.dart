import 'package:flutter/material.dart';

class AtomCircleButton extends StatelessWidget {
  const AtomCircleButton({Key? key, required this.text, required this.ontap})
      : super(key: key);
  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        child: InkWell(
          onTap: () {
            print('-----');
            ontap();
          },
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue,
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
