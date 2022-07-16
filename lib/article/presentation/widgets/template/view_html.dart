import 'dart:math';

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'fake_ui.dart' if (dart.library.html) 'real_ui.dart' as ui;

class ViewHtml extends StatefulWidget {
  const ViewHtml({Key? key}) : super(key: key);

  @override
  _ViewHtmlState createState() => _ViewHtmlState();
}

class _ViewHtmlState extends State<ViewHtml> {
  late js.JsObject connector;
  String createdViewId = Random().nextInt(1000).toString();
  late html.IFrameElement element;
  String htmlText = """​<!DOCTYPE html>
<html>
<body>
<p>
This is the sample text from flutter.
</p>
<p>
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.
Please subscribe to Breaking Code YT Channel.

</p>
</body>
</html>
""";

  @override
  void initState() {
    js.context["connect_content_to_flutter"] = (js.JsObject content) {
      connector = content;
    };
    element = html.IFrameElement()
      ..src = "/assets/view.html"
      ..style.border = 'none';

    ui.platformViewRegistry
        .registerViewFactory(createdViewId, (int viewId) => element);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: getMessageFromHTML,
                    child: const Text("GET MESSAGE FROM HTMLxx")),
                ElevatedButton(
                    onPressed: () {
                      sendMessageToHTML(htmlText);
                    },
                    child: const Text("SEND MESSAGE TO HTMLxx"))
              ],
            ),
            const SizedBox(height: 50),
            Container(
              color: Colors.red,
              height: 340,
              padding: const EdgeInsets.all(10),
              child: HtmlElementView(
                viewType: createdViewId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getMessageFromHTML() {
    // final String str = connector.callMethod(
    //   'getValue',
    // ) as String;
    // print(str);
  }

  void sendMessageToHTML(String data) {
    element.contentWindow!.postMessage({
      'id': 'sample',
      'msg': data,
    }, "*");
  }
}
