import 'package:flutter/material.dart';
import 'package:myapp/Pages/IntroPage.dart';
import 'package:myapp/Pages/shopPage.dart';
import 'package:myapp/Pages/CartPage.dart';
import 'package:myapp/Pages/SettingsPage.dart';
import 'package:myapp/themes/lightMode.dart';
import 'package:myapp/themes/darkmodetheme.dart';
import 'package:myapp/themes/themeprovider.dart';
import 'package:myapp/models/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeProvider.themeMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}