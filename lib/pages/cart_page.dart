// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/models/catalog.dart';

class CartPage extends StatelessWidget {
  final cart = (VxState.store as MyStore).cartModel;

  final catalog = CatalogModel();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        const Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final cart = (VxState.store as MyStore).cartModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.colorScheme.secondary)
              .make(),
          30.widthBox,
          ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.colorScheme.secondary,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  child: "Buy"
                      .text
                      .color(context.theme.textTheme.bodyMedium?.color)
                      .make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final cart = (VxState.store as MyStore).cartModel;
  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty
        ? "Nothing to show".text.xl2.make().centered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {
                  cart.removeItem(cart.items[index]);
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: cart.items[index].name.text.make(),
            ),
          );
  }
}
