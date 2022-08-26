import 'dart:math';

import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_divider.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_body_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_image_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_title_article.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class ItemArticle extends StatelessWidget {
  const ItemArticle({Key? key, required this.articleModel}) : super(key: key);
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('========> size $size');
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      constraints: BoxConstraints(maxHeight: size.width > 750 ? 200 : 500),
      width: min(size.width * 0.9, 1280),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AtomDivider(),
          const SizedBox(height: 15),
          Expanded(
            child:
                size.width > 750 ? _ifIsWindows(context) : _ifIsMobile(context),
          ),
        ],
      ),
    );
  }

  InkWell _ifIsWindows(BuildContext context) {
    return InkWell(
      onTap: () => _onpress(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalizedTitleArticle(
              title: '${articleModel.orderLevel} - ${articleModel.title}',
              seeMore: () => _onpress(context)),
          PersonalizedBodyArticle(description: articleModel.description),
          const SizedBox(width: 20),
          _personalizedImageArticle(),
        ],
      ),
    );
  }

  InkWell _ifIsMobile(BuildContext context) {
    return InkWell(
      onTap: () => _onpress(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalizedImageArticle(flex: 3, width: double.infinity),
          PersonalizedTitleArticle(
            title: '${articleModel.orderLevel} - ${articleModel.title}',
            seeMore: () => _onpress(context),
            maxHeight: 250,
          ),
          // PersonalizedBodyArticle(description: articleModel.description),
        ],
      ),
    );
  }

  Expanded _personalizedImageArticle({flex = 1, width = 160}) {
    return Expanded(
      flex: flex,
      child: Hero(
        tag: '${articleModel.idArticulo}',
        child: PersonalizedImageArticle(
            urlImage: articleModel.imageURL, width: width),
      ),
    );
  }

  void _onpress(BuildContext context) {
    navigateToPage(context, ArticlePage(article: articleModel));
  }
}
