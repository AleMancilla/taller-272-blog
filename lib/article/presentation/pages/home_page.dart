import 'package:blog_taller_base_de_datos/article/data/datasource/read_articles_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/read_list_article_firestore_repository_implements.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_title.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_app_bar.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> listArticle = [];

  ReadListArticleFirestoreRepositoryImplements
      readListArticleFirestoreRepositoryImplements =
      ReadListArticleFirestoreRepositoryImplements();

  @override
  void initState() {
    chargeData();
    super.initState();
  }

  chargeData() async {
    Future.delayed(Duration.zero, () {
      loadingAsyncFunction(context, () async => asingAllItems());
    });
  }

  asingAllItems() async {
    listArticle =
        await readListArticleFirestoreRepositoryImplements.readListArticles();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CreateArticlePage(),
          ),
        );
      }),
      body: Container(
        child: Column(
          children: [
            PersonalizedAppBar(),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  child: Column(
                    children: [PersonalizedTitle(), ...getListArticle()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getListArticle() {
    return listArticle.map((e) => ItemArticle(articleModel: e)).toList();
  }
}
