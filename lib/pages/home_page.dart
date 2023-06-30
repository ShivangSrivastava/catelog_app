// ignore_for_file: prefer_const_constructors

import 'package:catelog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World Day 2'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
