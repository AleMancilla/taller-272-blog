import 'package:flutter/material.dart';

void openPage(BuildContext context, Widget page) {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}

Future loadingAsyncFunction(BuildContext context, Function function) async {
  showProgressIndicator(context);
  await function();
  Navigator.pop(context);
}

showProgressIndicator(BuildContext context) {
// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Scaffold(
        backgroundColor: Colors.white12,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
