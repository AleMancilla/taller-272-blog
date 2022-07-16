import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('user');
CollectionReference articles = FirebaseFirestore.instance.collection('article');
