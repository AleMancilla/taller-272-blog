import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadArticlesFirestoreDatasource {
  Future<List<ArticleModel>> readArticles() async {
    List<ArticleModel> listArticle = [];
    await articles.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ArticleModel articleModel = ArticleModel(
          title: doc['description'],
          description: doc['imageURL'],
          imageURL: doc['title'],
        );
        listArticle.add(articleModel);
      });
    });

    return listArticle;
  }
}
