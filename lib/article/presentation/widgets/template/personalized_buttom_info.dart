import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalizedButtomInfo extends StatelessWidget {
  const PersonalizedButtomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      height: 150,
      child: RichText(
        text: TextSpan(
            text:
                'La Paz - Bolivia | Copyright ©2022 Informática UMSA Todos los derechos reservados | Diseño y programación: ',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: 'Alejandro Mancilla',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl('https://github.com/AleMancilla');
                    }),
            ]),
      ),
      //La Paz - Bolivia | Copyright ©2016 Informática UMSA Todos los derechos reservados | Diseño y programación: DeveNet SRL
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}
