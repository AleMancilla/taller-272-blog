import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_divider.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_body_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_image_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_title_article.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class ItemArticle extends StatelessWidget {
  const ItemArticle({Key? key, required this.articleModel}) : super(key: key);
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      constraints: const BoxConstraints(maxHeight: 200),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AtomDivider(),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonalizedTitleArticle(
                  title: articleModel.title, seeMore: _onpress),
              PersonalizedBodyArticle(description: articleModel.description),
              PersonalizedImageArticle(urlImage: articleModel.imageURL),
            ],
          ),
        ],
      ),
    );
  }

  void _onpress() {
    print('object');
  }
}
