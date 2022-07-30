import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadArticlesFirestoreDatasource {
  Future<List<ArticleModel>> readArticles() async {
    List<ArticleModel> listArticle = [];
    await articles.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        try {
          Map _json = (doc.data() as Map);
          ArticleModel articleModel = ArticleModel(
              title: _json['title'],
              description: _json['description'],
              imageURL: _json['imageURL'],
              groupTheme: _json['groupTheme'] ?? 'General',
              collaborators: (_json['collaborators'] as List)
                  .map((e) => e as String)
                  .toList(),
              dateCreation: DateTime.parse(
                  (_json['creationDate'] as Timestamp).toDate().toString()),
              dateModify: DateTime.parse(
                  (_json['actualizationDate'] as Timestamp)
                      .toDate()
                      .toString()),
              orderLevel: _json['importanceLevel'] ?? 1,
              idArticulo: doc.id);
          listArticle.add(articleModel);
        } catch (e) {
          throw 'Error de lectura: $e';
        }
      }
    });

    return listArticle;
  }
}
