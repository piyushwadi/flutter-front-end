import 'package:flutter/material.dart';
import 'package:fluttertry2/views/homepage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<LanguageService>(LanguageService());
  runApp(MyApp());
}

class LanguageService {
  final _language = BehaviorSubject.seeded("English");

  String get current => _language.value;

  setLanguage(String newLanguage) {
    _language.add(newLanguage);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
