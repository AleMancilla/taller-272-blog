import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/atom/atom_divider.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/molecule/article/personalized_body_article.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/molecule/article/personalized_image_article.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/molecule/article/personalized_title_article.dart';
import 'package:flutter/material.dart';

class ItemArticle extends StatelessWidget {
  const ItemArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      constraints: BoxConstraints(maxHeight: 200),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AtomDivider(),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonalizedTitleArticle(
                  title: 'titletitle title titletitle title',
                  seeMore: _onpress),
              PersonalizedBodyArticle(
                  description:
                      'Est eu mollit sint cupidatat aliqua. Est cillum elit sit voluptate sunt elit enim ad. Ad esse do nisi non est irure qui enim dolor nisi esse quis. Duis ex consequat est velit tempor aliquip velit incididunt. Minim elit ad exercitation sint eu laboris in veniam voluptate dolore aliquip voluptate ipsum.'),
              PersonalizedImageArticle(
                  urlImage:
                      'https://www.moradam.com/wp-content/uploads/2021/12/Oracle.jpg'),
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
