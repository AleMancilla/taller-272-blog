import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadArticlesFirestoreDatasource {
  Future<List<ArticleModel>> readArticles() async {
    List<ArticleModel> listArticle = [];
    await articles.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ArticleModel articleModel = ArticleModel(
            title: doc['title'],
            description: doc['description'],
            imageURL: doc['imageURL'],
            idArticulo: doc.id);
        listArticle.add(articleModel);
      }
    });

    return listArticle;
  }
}
