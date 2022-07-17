import 'dart:math';

import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'fake_ui.dart' if (dart.library.html) 'real_ui.dart' as ui;

class TemplateCreateArticle extends StatefulWidget {
  const TemplateCreateArticle(
      {Key? key,
      this.onButtonPress,
      this.imageUrl,
      this.title,
      this.description})
      : super(key: key);
  final Function? onButtonPress;
  final String? imageUrl;
  final String? title;
  final String? description;

  @override
  State<TemplateCreateArticle> createState() => _TemplateCreateArticleState();
}

class _TemplateCreateArticleState extends State<TemplateCreateArticle> {
  final TextEditingController controllerimageUrl = TextEditingController();
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();

  late js.JsObject connector;
  String createdViewId = Random().nextInt(1000).toString();
  late html.IFrameElement element;
  String htmlText = """​<!DOCTYPE html>
<html>
<body>
<p>
This is the sample text from flutter.
</p>
<p>
Please subscribe to <strong>Breaking Code<strong> YT Channel.
</p>
</body>
</html>
""";

  @override
  void initState() {
    js.context["connect_content_to_flutter"] = (js.JsObject content) {
      connector = content;
    };
    element = html.IFrameElement()
      ..src = "/assets/editor.html"
      ..style.border = 'none';

    ui.platformViewRegistry
        .registerViewFactory(createdViewId, (int viewId) => element);
    if (widget.imageUrl != null) controllerimageUrl.text = widget.imageUrl!;
    if (widget.title != null) controllerTitle.text = widget.title!;
    if (widget.description != null) {
      controllerDescription.text = widget.description!;
    }
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      if (widget.description != null) {
        try {
          sendMessageToEditor(controllerDescription.text);
        } catch (e) {
          showErrorAlert(context, 'Error al cargar contenido',
              'Por favor vuelva a intentarlo');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: min(size.width, 1080),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AtomTextTitle(title: "CREAR ARTICULO"),
          AtomInputText(
            controller: controllerimageUrl,
            labelText: 'Imagen URL',
            width: double.infinity,
          ),
          AtomInputText(
            controller: controllerTitle,
            labelText: 'Titulo',
            width: double.infinity,
          ),
          // AtomInputText(
          //   controller: controllerDescription,
          //   labelText: 'Descripcion',
          //   width: double.infinity,
          // ),
          Container(
            child: const Text('Descripcion'),
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10),
          ),
          Container(
            color: Colors.white,
            height: 370,
            child: HtmlElementView(
              viewType: createdViewId,
            ),
          ),
          AtomButtonGlobal(
            textButton:
                widget.title != null ? 'Editar Articulo' : 'Crear Articulo',
            onTap: () => getDataFromArticle(context),
          ),
        ],
      ),
    );
  }

  void getDataFromArticle(BuildContext context) {
    final _userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);

    widget.onButtonPress!(ArticleModel(
        title: controllerTitle.text,
        description: getMessageFromEditor(),
        imageURL: controllerimageUrl.text,
        collaborators: [
          '${_userBlocProvider.state.user?.name ?? _userBlocProvider.state.user?.level}'
        ]));

    controllerimageUrl.clear();
    controllerTitle.clear();
    controllerDescription.clear();
  }

  String getMessageFromEditor() {
    final String str = connector.callMethod(
      'getValue',
    ) as String;
    return str;
  }

  void sendMessageToEditor(String data) {
    element.contentWindow!.postMessage({
      'id': 'value',
      'msg': data,
    }, "*");
  }
}
