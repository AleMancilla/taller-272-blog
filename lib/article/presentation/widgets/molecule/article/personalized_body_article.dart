import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_body_html.dart';
import 'package:flutter/material.dart';

class PersonalizedBodyArticle extends StatelessWidget {
  const PersonalizedBodyArticle({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: Container(
        // color: Colors.red,
        // padding: const EdgeInsets.only(left: 15, right: 20),
        constraints: const BoxConstraints(maxHeight: 160),
        child: _buildWebViewX(screenSize),
      ),
    );
  }

  Widget _buildWebViewX(Size screenSize) {
    return ClipRRect(
      child: SingleChildScrollView(
        child: AtomBodyHTML(
          description: description,
        ),
      ),
    );
  }
}
