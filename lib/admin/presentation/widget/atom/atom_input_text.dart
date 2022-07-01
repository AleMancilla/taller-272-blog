import 'package:flutter/material.dart';

class AtomInputText extends StatelessWidget {
  const AtomInputText({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 10),
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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 2,
              ),
            ),
            labelStyle: TextStyle(color: Colors.black)
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