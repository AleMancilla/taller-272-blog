import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_input_search.dart';
import 'package:flutter/material.dart';

class PersonalizedSearch extends StatelessWidget {
  const PersonalizedSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AtomInputSearch(),
        Icon(Icons.search),
      ],
    );
  }
}
