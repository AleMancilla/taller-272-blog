import 'package:flutter/material.dart';

class PersonalizedTitleArticle extends StatelessWidget {
  const PersonalizedTitleArticle({
    Key? key,
    required this.title,
    required this.seeMore,
  }) : super(key: key);
  final String title;
  final Function seeMore;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 140),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          InkWell(
            onTap: () => seeMore(),
            child: const Text(
              'Ver mas ->',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
