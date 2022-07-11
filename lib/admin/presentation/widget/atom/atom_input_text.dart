import 'package:flutter/material.dart';

class AtomInputText extends StatelessWidget {
  const AtomInputText({
    Key? key,
    required this.controller,
    required this.labelText,
    this.width = 300,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.red,
            //     width: 5,
            //   ),
            // ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
                width: 1,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 2,
              ),
            ),
            labelStyle: const TextStyle(color: Colors.black)
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.red,
            //     width: 5,
            //   ),
            // ),
            ),
      ),
    );
  }
}
