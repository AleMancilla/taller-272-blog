import 'package:flutter/material.dart';

void openPage(BuildContext context, Widget page) {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}
