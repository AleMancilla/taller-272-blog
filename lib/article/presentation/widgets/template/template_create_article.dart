import 'dart:math';

import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/molecule/drop_down_list.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/groups_article_bloc.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'fake_ui.dart' if (dart.library.html) 'real_ui.dart' as ui;

class TemplateCreateArticle extends StatefulWidget {
  const TemplateCreateArticle({
    Key? key,
    this.onButtonPress,
    this.imageUrl,
    this.title,
    this.description,
    this.levelGroup,
  }) : super(key: key);
  final Function? onButtonPress;
  final String? imageUrl;
  final String? title;
  final String? description;
  final double? levelGroup;

  @override
  State<TemplateCreateArticle> createState() => _TemplateCreateArticleState();
}

class _TemplateCreateArticleState extends State<TemplateCreateArticle> {
  final TextEditingController controllerimageUrl = TextEditingController();
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerGrupo = TextEditingController();
  final TextEditingController controllerLevel = TextEditingController();

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
    if (widget.levelGroup != null) {
      controllerLevel.text =
          widget.levelGroup.toString().substring(1).replaceAll('.', '');
      Future.delayed(Duration.zero, () {
        controllerGrupo.text = getNameGroup(context, widget.levelGroup!);
        setState(() {});
        print('=====>>>> ${controllerGrupo.text}');
      });
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
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: AtomInputText(
                    controller: controllerLevel,
                    labelText: 'Punto Del Grupo, (solo numero)',
                    width: double.infinity,
                  ),
                ),
                Expanded(
                  child: DropDownList(
                    controllerLevel: controllerGrupo,
                    listItems: getListGroups(context),
                    defaultText: controllerGrupo.text != ''
                        ? controllerGrupo.text
                        : 'Elija el Grupo al que pertenecera',
                  ),
                  // AtomInputText(
                  //   controller: controllerGrupo,
                  //   labelText: 'Grupo',
                  //   width: double.infinity,
                  // ),
                ),
              ],
            ),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AtomButtonGlobal(
                textButton: 'Cancelar',
                onTap: () => Navigator.pop(context),
                color: Colors.red,
              ),
              AtomButtonGlobal(
                textButton:
                    widget.title != null ? 'Guardar Cambios' : 'Crear Articulo',
                onTap: () => getDataFromArticle(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getDataFromArticle(BuildContext context) {
    final _userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);

    widget.onButtonPress!(
      ArticleModel(
          title: controllerTitle.text,
          description: getMessageFromEditor(),
          imageURL: controllerimageUrl.text,
          collaborators: [
            '${_userBlocProvider.state.user?.name ?? _userBlocProvider.state.user?.level}'
          ],
          groupTheme: controllerGrupo.text,
          orderLevel: double.parse(
              '${getNumberGroup(context, controllerGrupo.text)}.${controllerLevel.text}')),
    );

    controllerimageUrl.clear();
    controllerTitle.clear();
    controllerDescription.clear();
    controllerGrupo.clear();
    controllerLevel.clear();
  }

  List<String> getListGroups(BuildContext context) {
    GroupsArticleBloc groupsArticleBloc =
        BlocProvider.of<GroupsArticleBloc>(context, listen: false);

    return groupsArticleBloc.state.listGroup
        .map<String>((e) => e.title)
        .toList();
  }

  String getNameGroup(BuildContext context, double level) {
    GroupsArticleBloc groupsArticleBloc =
        BlocProvider.of<GroupsArticleBloc>(context, listen: false);

    GroupModel _groupModel = groupsArticleBloc.state.listGroup
        .firstWhere((e) => e.nivelOrdenamiento == (level.floor() * 1.0));

    return _groupModel.title;
  }

  double getNumberGroup(BuildContext context, String level) {
    GroupsArticleBloc groupsArticleBloc =
        BlocProvider.of<GroupsArticleBloc>(context, listen: false);

    GroupModel _groupModel =
        groupsArticleBloc.state.listGroup.firstWhere((e) => e.title == level);

    return _groupModel.nivelOrdenamiento;
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
