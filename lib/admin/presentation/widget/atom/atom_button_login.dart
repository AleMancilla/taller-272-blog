import 'package:flutter/material.dart';

class AtomButtonGlobal extends StatelessWidget {
  const AtomButtonGlobal(
      {Key? key, required this.textButton, this.onTap, this.color})
      : super(key: key);
  final String textButton;
  final Function? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              decoration: BoxDecoration(
                color: color ?? Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                textButton,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
          ),
        ),
      ),
    );
  }
}
