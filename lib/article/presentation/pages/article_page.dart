import 'dart:math';

import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/article_page_template.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        padding: size.width > 750
            ? EdgeInsets.symmetric(horizontal: max(50, size.width * 0.15))
            : const EdgeInsets.symmetric(horizontal: 2),
        child: ArticlePageTemplate(article: article),
      ),
    );
  }
}
