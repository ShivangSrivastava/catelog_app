import 'dart:convert';

import 'package:catelog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catelog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/models/catalog.dart';
import 'package:catelog_app/widgets/themes.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    var catalogJSON = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              (CatalogModel.items.isNotEmpty)
                  ? const CatalogList().py16().expand()
                  : const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
