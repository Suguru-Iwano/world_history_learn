import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/first_listview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final title = '世界史勉強アプリ';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: true,
      title: title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: new MenuPage(),
    );
  }
}
