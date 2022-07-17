import 'package:blog_taller_base_de_datos/article/data/respositories/read_list_article_firestore_repository_implements.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';

final ReadListArticleFirestoreRepositoryImplements
    readListArticleFirestoreRepositoryImplements =
    ReadListArticleFirestoreRepositoryImplements();

// final AppPreferens prefs = AppPreferens();

Future getAllArticles(_articleBloc) async {
  await readListArticleFirestoreRepositoryImplements
      .readListArticles()
      .then((value) {
    _articleBloc.add(ActivateArticleEvent(value));
  }).onError((error, stackTrace) {
    return throw '$error';
  });
}
