import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/theme.dart';
import 'package:catelog_app/pages/cart_page.dart';
import 'package:catelog_app/pages/home_page.dart';
import 'package:catelog_app/pages/login_page.dart';
import 'package:catelog_app/utils/routes.dart';
import 'package:catelog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: MyStore(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [ThemeMutation]);


    return MaterialApp(
      themeMode: ThemeManager.getTheme(),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
