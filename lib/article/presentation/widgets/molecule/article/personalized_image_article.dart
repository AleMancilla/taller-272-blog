import 'package:flutter/material.dart';

class PersonalizedImageArticle extends StatelessWidget {
  const PersonalizedImageArticle({Key? key, required this.urlImage})
      : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
