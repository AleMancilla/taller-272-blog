import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';

abstract class CreateArticleFirestoreRepository {
  Future createArticle(ArticleModel articleModel);
}
