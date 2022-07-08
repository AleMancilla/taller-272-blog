import 'package:blog_taller_base_de_datos/article/presentation/pages/home_page.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = AppPreferens();
  prefs.initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
