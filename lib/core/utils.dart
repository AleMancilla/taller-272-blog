import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

void openPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => page,
    ),
  );
}

Future loadingAsyncFunction(
  BuildContext context,
  Function function,
) async {
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

showErrorAlert(BuildContext context, String title, String description) {
  StatusAlert.show(
    context,
    duration: const Duration(milliseconds: 3500),
    title: title,
    subtitle: description,
    configuration: const IconConfiguration(icon: Icons.close),
  );
}

showCorrectAlert(BuildContext context, String title, String description) {
  StatusAlert.show(
    context,
    duration: const Duration(milliseconds: 3500),
    title: title,
    subtitle: description,
    configuration: const IconConfiguration(icon: Icons.check),
  );
}
