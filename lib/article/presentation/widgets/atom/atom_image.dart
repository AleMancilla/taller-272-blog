import 'package:flutter/material.dart';

class AtomImage extends StatelessWidget {
  const AtomImage({Key? key, required this.src}) : super(key: key);
  final String src;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // constraints: const BoxConstraints(maxHeight: 250),
      width: size.width * 0.6,
      height: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(src, fit: BoxFit.cover),
      ),
    );
  }
}
