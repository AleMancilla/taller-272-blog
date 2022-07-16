// import 'package:flutter/material.dart';
// import 'package:webviewx/webviewx.dart';

// class AtomBodyHTML extends StatelessWidget {
//   AtomBodyHTML({
//     Key? key,
//     required this.description,
//     this.height,
//     this.width,
//   }) : super(key: key);
//   final String description;
//   final double? height;
//   final double? width;

//   late WebViewXController webviewController;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       child: WebViewX(
//         key: const ValueKey('webviewx'),
//         initialContent: description,
//         initialSourceType: SourceType.html,
//         // height: Size.height,
//         height: height ?? ((size.height / 100) * 100),
//         // ignoreAllGestures: true,

//         width: width ?? ((size.width / 100) * 80),
//         onWebViewCreated: (controller) {
//           print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//           print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//           return webviewController = controller;
//         },
//         onPageStarted: (src) =>
//             debugPrint('A new page has started loading: $src\n'),
//         onPageFinished: (src) =>
//             debugPrint('The page has finished loading: $src\n'),
//         jsContent: const {
//           EmbeddedJsContent(
//             js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
//           ),
//           EmbeddedJsContent(
//             webJs:
//                 "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
//             mobileJs:
//                 "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
//           ),
//         },
//         // dartCallBacks: {
//         //   DartCallback(
//         //     name: 'TestDartCallback',
//         //     callBack: (msg) => showSnackBar(msg.toString(), context),
//         //   )
//         // },
//         webSpecificParams: const WebSpecificParams(
//           printDebugInfo: true,
//         ),
//         mobileSpecificParams: const MobileSpecificParams(
//           androidEnableHybridComposition: true,
//         ),
//         navigationDelegate: (navigation) {
//           debugPrint(navigation.content.sourceType.toString());
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }
