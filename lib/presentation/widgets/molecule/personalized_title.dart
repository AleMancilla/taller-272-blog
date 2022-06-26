import 'package:blog_taller_base_de_datos/presentation/widgets/atom/atom_subtitle.dart';
import 'package:blog_taller_base_de_datos/presentation/widgets/atom/atom_title.dart';
import 'package:flutter/material.dart';

class PersonalizedTitle extends StatelessWidget {
  const PersonalizedTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: const [
          AtomTitle(title: 'INF - 272'),
          AtomSubtitle(subtitle: 'Taller de base de datos'),
        ],
      ),
    );
  }
}
