import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';

abstract class EditArticleFirestoreRepository {
  Future editArticle(ArticleModel articleModel);
}
