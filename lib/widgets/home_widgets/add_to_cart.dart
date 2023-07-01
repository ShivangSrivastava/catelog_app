import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final int id;
  const AddToCart({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final catalog = CatalogModel();
  final cart = CartModel();
  bool isAddToCart = false;

  @override
  Widget build(BuildContext context) {
    isAddToCart = cart.isItemInCart(widget.id);
    return ElevatedButton(
      onPressed: () {
        cart.catalog = catalog;

        isAddToCart = !isAddToCart;

        if (isAddToCart) {
          cart.addItem(catalog.getItemById(widget.id));
        } else {
          cart.removeItem(catalog.getItemById(widget.id));
        }
        setState(() {});
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
          : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
