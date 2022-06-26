import 'package:blog_taller_base_de_datos/presentation/widgets/molecule/article/item_article.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/template/personalized_app_bar.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/molecule/personalized_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    children: [
                      PersonalizedTitle(),
                      ItemArticle(),
                      ItemArticle(),
                      ItemArticle(),
                      ItemArticle(),
                      ItemArticle(),
                      ItemArticle(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
