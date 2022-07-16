import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class AtomBodyHTML extends StatelessWidget {
  const AtomBodyHTML({
    Key? key,
    required this.description,
    this.height,
    this.width,
  }) : super(key: key);
  final String description;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      description,
      factoryBuilder: () => MyWidgetFactory(),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
