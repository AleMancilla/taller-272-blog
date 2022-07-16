import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_data_utils.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/pages/admin_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/home_page.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = AppPreferens();
  prefs.initPreferences();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: const MyApp(),
      providers: [
        BlocProvider<ArticleBloc>(create: (_) => ArticleBloc()),
        BlocProvider<UserBloc>(create: (_) => UserBloc()),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);
    chargeDataUser(_userBlocProvider);
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      // home: AdminPage(),
    );
  }

  // firstData(){
  //   chargeDataUser(_userBlocProvider)
  // }
}
