import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_single_button.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class TemplateUserListEdit extends StatelessWidget {
  const TemplateUserListEdit({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        children: [
          Icon(Icons.person),
          Text(user.user),
          Text(user.name ?? 'No Data'),
          PersonalizedSingleButton(
            text: 'Edit',
            ontap: () {
              // navigateToPage(
              //   context,
              //   CreateArticlePage(
              //     article: articleModel,
              //   ),
              // );
            },
          ),
          PersonalizedSingleButton(
              text: 'Delete',
              color: Colors.red,
              icon: Icons.close,
              ontap: () async {
                // await _deleteFunction(context);
              }),
        ],
      ),
    );
  }
}
