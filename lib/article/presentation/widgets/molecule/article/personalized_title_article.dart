import 'package:flutter/material.dart';

class PersonalizedTitleArticle extends StatelessWidget {
  const PersonalizedTitleArticle({
    Key? key,
    required this.title,
    this.seeMore,
    this.maxHeight = 140,
    this.color,
  }) : super(key: key);
  final String title;
  final Function? seeMore;
  final double maxHeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: Text(
              title,
              style: TextStyle(
                color: color ?? Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          if (seeMore != null)
            InkWell(
              onTap: () => seeMore!(),
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
