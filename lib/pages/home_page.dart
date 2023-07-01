// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:catelog_app/models/catalog.dart';
import 'package:catelog_app/widgets/drawer.dart';
import 'package:catelog_app/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJSON = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (int index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
