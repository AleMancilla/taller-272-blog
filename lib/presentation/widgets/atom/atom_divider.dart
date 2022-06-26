import 'package:flutter/material.dart';

class AtomDivider extends StatelessWidget {
  const AtomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: (size.width / 100) * 70,
      height: 1.5,
      color: Colors.black,
    );
  }
}
