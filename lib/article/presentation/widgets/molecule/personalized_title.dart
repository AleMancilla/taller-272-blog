import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_subtitle.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/atom/atom_title.dart';
import 'package:flutter/material.dart';

class PersonalizedTitle extends StatelessWidget {
  const PersonalizedTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: size.width > 750 ? _ifIsWeb() : _ifIsMobile(),
    );
  }

  Row _ifIsWeb() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [
              AtomTitle(title: 'INF - 272'),
              AtomSubtitle(subtitle: 'Taller de base de datos'),
            ],
          ),
        ),
        Image.asset(
          'assets/images/fcpn.png',
          height: 100,
        ),
        Image.asset(
          'assets/images/informatica.png',
          height: 100,
        ),
        Image.asset(
          'assets/images/UMSA.png',
          height: 100,
        ),
      ],
    );
  }

  Column _ifIsMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AtomTitle(title: 'INF - 272'),
        const AtomSubtitle(subtitle: 'Taller de base de datos'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/fcpn.png',
              height: 100,
            ),
            Image.asset(
              'assets/images/informatica.png',
              height: 100,
            ),
            Image.asset(
              'assets/images/UMSA.png',
              height: 100,
            ),
          ],
        ),
      ],
    );
  }
}
