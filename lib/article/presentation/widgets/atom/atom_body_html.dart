import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:url_launcher/url_launcher.dart';

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
      onTapUrl: (data) {
        _launchUrl(data);
        return true;
      },
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
