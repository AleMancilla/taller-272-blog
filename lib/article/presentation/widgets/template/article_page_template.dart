import 'dart:math';

import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_body_html.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_image.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_title.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class ArticlePageTemplate extends StatelessWidget {
  const ArticlePageTemplate({Key? key, required this.article})
      : super(key: key);
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    //       width: min(size.width, 900),
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      // constraints: const BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: '${article.idArticulo}',
              child: AtomImage(src: article.imageURL),
            ),
            AtomTitle(title: article.title),
            AtomBodyHTML(description: article.description),
          ],
        ),
      ),
    );
  }
}
