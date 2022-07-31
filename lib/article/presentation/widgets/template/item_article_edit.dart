import 'dart:math';

import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/delete_article_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_divider.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_image_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_title_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_single_button.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class ItemArticleEdit extends StatelessWidget {
  const ItemArticleEdit({Key? key, required this.articleModel})
      : super(key: key);
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      constraints: const BoxConstraints(maxHeight: 200),
      width: min(size.width * 0.9, 1280),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AtomDivider(),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _personalizedImageArticle(),
              const SizedBox(width: 20),
              PersonalizedTitleArticle(
                  title: '${articleModel.orderLevel} - ${articleModel.title}',
                  seeMore: () => _onpress(context),
                  maxHeight: 90),
              PersonalizedSingleButton(
                text: 'Edit',
                ontap: () {
                  navigateToPage(
                    context,
                    CreateArticlePage(
                      article: articleModel,
                    ),
                  );
                },
              ),
              PersonalizedSingleButton(
                  text: 'Delete',
                  color: Colors.red,
                  icon: Icons.close,
                  ontap: () async {
                    await _deleteFunction(context);
                  }),
            ],
          ),
        ],
      ),
    );
  }

  _deleteFunction(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Alerta'),
            content: Text('Seguro que quieres eliminar el articulo'),
            actions: [
              ActionChip(
                  label: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ActionChip(
                  label: Text('Aceptar'),
                  onPressed: () async {
                    DeleteArticleFirestoreRepositoryImplement
                        deleteArticleFirestoreRepositoryImplement =
                        DeleteArticleFirestoreRepositoryImplement();
                    await loadingAsyncFunction(
                      context,
                      () async {
                        await deleteArticleFirestoreRepositoryImplement
                            .deleteArticle(articleModel.idArticulo!);

                        chargeAllArticles(context);
                        return;
                      },
                    );
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  Expanded _personalizedImageArticle() {
    return Expanded(
      flex: 1,
      child: Hero(
        tag: '${articleModel.idArticulo}',
        child: PersonalizedImageArticle(
            urlImage: articleModel.imageURL, height: 150),
      ),
    );
  }

  void _onpress(BuildContext context) {
    navigateToPage(context, ArticlePage(article: articleModel));
  }
}
