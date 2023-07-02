// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final cart = (VxState.store as MyStore).cartModel;
    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: catalog);
        } else {
          RemoveMutation(item: catalog);
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
      child: (isInCart)
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
