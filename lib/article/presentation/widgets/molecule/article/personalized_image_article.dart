import 'package:flutter/material.dart';

class PersonalizedImageArticle extends StatelessWidget {
  const PersonalizedImageArticle(
      {Key? key, required this.urlImage, this.height = 160})
      : super(key: key);
  final String urlImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: height,
        // constraints: const BoxConstraints(maxHeight: 160),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
