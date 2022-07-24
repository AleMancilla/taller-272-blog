import 'package:blog_taller_base_de_datos/article/data/respositories/read_list_article_firestore_repository_implements.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

Widget chargeAllArticlesWidget(BuildContext context,
    {ArticleBloc? articleBloc}) {
  chargeAllArticles(context, articleBloc: articleBloc);

  return Container();
}

Future<void> chargeAllArticles(BuildContext context,
    {ArticleBloc? articleBloc}) async {
  articleBloc ??= BlocProvider.of<ArticleBloc>(context, listen: false);
  await Future.delayed(Duration.zero, () async {
    // showProgressIndicator(context);
    await loadingAsyncFunction(
        context, () async => await getAllArticles(articleBloc));
  });
}
