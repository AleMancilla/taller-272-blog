import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadGroupsFirestoreDatasource {
  Future<List<GroupModel>> readGroups() async {
    List<GroupModel> listGroups = [];
    await groups.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        try {
          Map _json = (doc.data() as Map);

          GroupModel groupModel = GroupModel(
            _json['title'],
            nivelOrdenamiento: _json['nivelOrdenamiento'],
          );
          // ArticleModel articleModel = ArticleModel(
          //     title: _json['title'],
          //     description: _json['description'],
          //     imageURL: _json['imageURL'],
          //     groupTheme: _json['groupTheme'] ?? 'General',
          //     collaborators: (_json['collaborators'] as List)
          //         .map((e) => e as String)
          //         .toList(),
          //     dateCreation: DateTime.parse(
          //         (_json['creationDate'] as Timestamp).toDate().toString()),
          //     dateModify: DateTime.parse(
          //         (_json['actualizationDate'] as Timestamp)
          //             .toDate()
          //             .toString()),
          //     orderLevel: _json['orderLevel'] ?? 1,
          //     idArticulo: doc.id);
          listGroups.add(groupModel);
        } catch (e) {
          throw 'Error de lectura: $e';
        }
      }
    });

    return listGroups;
  }
}
