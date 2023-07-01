import 'package:catelog_app/pages/home_page.dart';
import 'package:catelog_app/pages/login_page.dart';
import 'package:catelog_app/utils/routes.dart';
import 'package:catelog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
