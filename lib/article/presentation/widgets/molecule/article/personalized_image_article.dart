import 'package:flutter/material.dart';

class PersonalizedImageArticle extends StatelessWidget {
  const PersonalizedImageArticle({Key? key, required this.urlImage})
      : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 160,
        // constraints: const BoxConstraints(maxHeight: 160),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
