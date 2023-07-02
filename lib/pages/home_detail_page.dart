import 'package:catelog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catelog_app/widgets/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:catelog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: context.theme.canvasColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: Container(
            color: context.cardColor,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.m0,
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                AddToCart(
                  catalog: catalog,
                )
              ],
            ).pOnly(right: 8).p32(),
          ),
          body: SafeArea(
            bottom: false,
            child: Column(children: [
              Hero(
                tag: Key(
                  catalog.id.toString(),
                ),
                child: Image.network(catalog.image),
              ).h32(context).px8(),
              Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl3.bold
                            .color(context.theme.colorScheme.secondary)
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        "Diam vero rebum vero diam consetetur duo et labore duo dolor. Eos takimata sit dolor sanctus magna est stet amet vero, eos "
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py64(),
                  ),
                ),
              )
            ]),
          ),
        ),
        const ThemeChanger()
      ],
    );
  }
}
