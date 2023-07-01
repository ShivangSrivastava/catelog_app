// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';
import 'package:catelog_app/pages/home_detail_page.dart';
import 'package:catelog_app/widgets/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.lg.bold
                .color(context.theme.textTheme.titleMedium?.color)
                .make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.m0,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(
                  id: catalog.id,
                ),
              ],
            ).pOnly(right: 8),
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.make().py16();
  }
}

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
  // check id is in the cart if yes then add to cart will true
  // if not then add to cart will false
  @override
  void initState() {
    super.initState();
    isAddToCart = cart.isItemInCart(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAddToCart = !isAddToCart;

        cart.catalog = catalog;
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
      child: (isAddToCart) ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
