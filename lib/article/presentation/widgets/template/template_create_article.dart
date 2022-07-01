import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:flutter/material.dart';

class TemplateCreateArticle extends StatelessWidget {
  TemplateCreateArticle({Key? key, this.onButtonPress}) : super(key: key);
  final TextEditingController controllerimageUrl = TextEditingController();
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final Function? onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AtomTextTitle(title: "CREAR ARTICULO"),
          AtomInputText(
            controller: controllerimageUrl,
            labelText: 'Imagen URL',
          ),
          AtomInputText(
            controller: controllerTitle,
            labelText: 'Titulo',
          ),
          AtomInputText(
            controller: controllerDescription,
            labelText: 'Descripcion',
          ),
          AtomButtonGlobal(
            textButton: 'Crear Articulo',
            onTap: insrtArticle,
          ),
        ],
      ),
    );
  }

  insrtArticle() {
    onButtonPress!(ArticleModel(
      title: controllerimageUrl.text,
      description: controllerTitle.text,
      imageURL: controllerDescription.text,
    ));

    controllerimageUrl.clear();
    controllerTitle.clear();
    controllerDescription.clear();
  }
}
