import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class PersonalizedBodyArticle extends StatelessWidget {
  PersonalizedBodyArticle({Key? key, required this.description})
      : super(key: key);

  final String description;

  late WebViewXController webviewController;
  final initialContent = '<h4> Cargando... <h4>';
  final executeJsErrorMessage =
      'Failed to execute this task because the current content is (probably) URL that allows iframe embedding, on Web.\n\n'
      'A short reason for this is that, when a normal URL is embedded in the iframe, you do not actually own that content so you cant call your custom functions\n'
      '(read the documentation to find out why).';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: Container(
        // color: Colors.red,
        // padding: const EdgeInsets.only(left: 15, right: 20),
        constraints: const BoxConstraints(maxHeight: 160),
        child: _buildWebViewX(screenSize),
      ),
    );
  }

  Widget _buildWebViewX(Size screenSize) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: description,
      initialSourceType: SourceType.html,
      height: screenSize.height / 2,
      width: min(screenSize.width * 0.8, 1024),
      onWebViewCreated: (controller) => webviewController = controller,
      onPageStarted: (src) =>
          debugPrint('A new page has started loading: $src\n'),
      onPageFinished: (src) =>
          debugPrint('The page has finished loading: $src\n'),
      jsContent: const {
        EmbeddedJsContent(
          js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
        ),
        EmbeddedJsContent(
          webJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
          mobileJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
      },
      // dartCallBacks: {
      //   DartCallback(
      //     name: 'TestDartCallback',
      //     callBack: (msg) => showSnackBar(msg.toString(), context),
      //   )
      // },
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        debugPrint(navigation.content.sourceType.toString());
        return NavigationDecision.navigate;
      },
    );
  }
}
