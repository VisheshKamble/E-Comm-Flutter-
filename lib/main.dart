import 'package:flutter/material.dart';
import 'package:myapp/Pages/IntroPage.dart';
import 'package:myapp/Pages/shopPage.dart';
import 'package:myapp/themes/lightMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
      },
    );
  }
}
