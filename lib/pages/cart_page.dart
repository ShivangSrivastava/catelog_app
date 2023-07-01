// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cart = CartModel();

  final catalog = CatalogModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList(
          cart: cart,
        ).p32().expand(),
        const Divider(),
        _CartTotal(
          cart: cart,
        ),
      ]),
    );
  }
}

class _CartTotal extends StatefulWidget {
  final CartModel cart;
  const _CartTotal({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${widget.cart.totalPrice}"
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

class _CartList extends StatefulWidget {
  final CartModel cart;

  const _CartList({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_circle_outline),
        ),
        title: widget.cart.items[index].name.text.make(),
      ),
    );
  }
}
