import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/article_page_template.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ArticlePageTemplate(article: article),
      ),
    );
  }
}
