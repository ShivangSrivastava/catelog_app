import 'dart:convert';

import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/utils/routes.dart';
import 'package:catelog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catelog_app/widgets/home_widgets/catalog_list.dart';
import 'package:catelog_app/widgets/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import 'package:catelog_app/models/catalog.dart';

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

  final url =
      "https://raw.githubusercontent.com/ShivangSrivastava/catelog_app/day25/assets/files/catalog.json";
  loadData() async {
    http.Response response = await http.get(Uri.parse(url));
    var catalogJSON = response.body;
    var decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cartModel;

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: context.canvasColor,
            floatingActionButton: VxConsumer(
              mutations: const {AddMutation, RemoveMutation},
              builder: (context, store, status) {
                return FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.cartRoute);
                  },
                  backgroundColor: context.theme.colorScheme.secondary,
                  child: const Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  ),
                ).badge(
                  count: cart.items.length,
                  size: 20,
                );
              },
            ),
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
          ),
          const ThemeChanger()
        ],
      ),
    );
  }
}
