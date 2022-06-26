import 'package:flutter/material.dart';

class PersonalizedBodyArticle extends StatelessWidget {
  const PersonalizedBodyArticle({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 20),
        constraints: BoxConstraints(maxHeight: 160),
        child: Text(
          description,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
