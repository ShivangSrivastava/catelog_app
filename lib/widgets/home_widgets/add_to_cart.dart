// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final int id;

  AddToCart({
    Key? key,
    required this.id,
  }) : super(key: key);
  final _catalog = CatalogModel();

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isAddToCart = _cart.isItemInCart(id);
    return ElevatedButton(
      onPressed: () {
        _cart.catalog = _catalog;

        isAddToCart = !isAddToCart;

        if (isAddToCart) {
          _cart.addItem(_catalog.getItemById(id));
        } else {
          _cart.removeItem(_catalog.getItemById(id));
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.theme.colorScheme.secondary),
        foregroundColor: MaterialStateProperty.all(
            context.theme.textTheme.titleMedium?.color),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: (isAddToCart)
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
