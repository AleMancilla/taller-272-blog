import 'dart:math';

import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/read_list_group_firestore_repository_implements.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/groups_article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/article/personalized_title_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article_edit.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ReadListGroupFirestoreRepositoryImplements
    readListGroupFirestoreRepositoryImplements =
    ReadListGroupFirestoreRepositoryImplements();

Future getAllGroups(_groupBloc) async {
  await readListGroupFirestoreRepositoryImplements
      .readListGroup()
      .then((value) {
    _groupBloc.add(GroupsArticleSetStateEvent(value));
  }).onError((error, stackTrace) {
    return throw '$error';
  });
}

Widget chargeAllGroupWidget(BuildContext context,
    {GroupsArticleBloc? groupArticleBloc}) {
  chargeAllGroup(context, articleBloc: groupArticleBloc);

  return Container();
}

Widget showListGroup(ArticleState articleState,
    GroupsArticleBloc _groupArticleBloc, GroupsArticleState stateGroup,
    {bool edit = false}) {
  return Container(
    color: Colors.blue,
    child: SingleChildScrollView(
      child: Column(
        children: [
          ...getListArticle(articleState.listArticle!, stateGroup.listGroup,
              edit: edit)
          // ...getListGroup(state.listGroup),
        ],
      ),
    ),
  );
}

Future<void> chargeAllGroup(BuildContext context,
    {GroupsArticleBloc? articleBloc}) async {
  articleBloc ??= BlocProvider.of<GroupsArticleBloc>(context, listen: false);
  await Future.delayed(Duration.zero, () async {
    // showProgressIndicator(context);
    await loadingAsyncFunction(context, () async {
      return await getAllGroups(articleBloc);
    });
  });
}

Widget getBlocGroups(ArticleState articleState,
    GroupsArticleBloc _groupArticleBloc, BuildContext context,
    {bool edit = false}) {
  return BlocBuilder<GroupsArticleBloc, GroupsArticleState>(
    builder: (_, state) {
      if (state is GroupsArticleInitial) {
        return chargeAllGroupWidget(context,
            groupArticleBloc: _groupArticleBloc);
      } else if (state is GroupsArticleSetState) {
        return showListGroup(
          articleState,
          _groupArticleBloc,
          state,
          edit: edit,
        );
      }
      return Container();
    },
  );
}

List<Widget> getListArticle(
    List<ArticleModel> listArticle, List<GroupModel> listGroup,
    {bool edit = false}) {
  List<GroupModel> listGroupArticleOrderLevel =
      listGroup.map((e) => e).toList();

  List<ArticleModel> listArticleOrderByLevel =
      listArticle.map((e) => e).toList();

  listGroupArticleOrderLevel
      .sort((a, b) => (a.nivelOrdenamiento).compareTo(b.nivelOrdenamiento));

  listArticleOrderByLevel
      .sort((a, b) => (a.orderLevel).compareTo(b.orderLevel));

  List<Widget> listReturn = [];

  for (var group in listGroupArticleOrderLevel) {
    listReturn.add(Builder(builder: (context) {
      Size size = MediaQuery.of(context).size;
      return Container(
        padding:
            const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
        constraints: const BoxConstraints(maxHeight: 100),
        width: min(size.width * 0.9, 1280),
        color: Colors.blueGrey[900],
        height: 500,
        child: Row(
          children: [
            PersonalizedTitleArticle(
              title: '${group.nivelOrdenamiento} - ${group.title}',
              color: Colors.white,
              // maxHeight: 200,
            ),
          ],
        ),
      );
    }));
    for (var article in listArticleOrderByLevel) {
      if (article.orderLevel >= group.nivelOrdenamiento &&
          article.orderLevel < group.nivelOrdenamiento + 1) {
        if (edit) {
          listReturn.add(ItemArticleEdit(articleModel: article));
        } else {
          listReturn.add(ItemArticle(articleModel: article));
        }
      }
    }
  }

  return listReturn;
}
