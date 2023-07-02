import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catalog.dart';
import 'package:catelog_app/models/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalogModel;
  late CartModel cartModel;
  late ThemeManager theme;
  MyStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
    theme = ThemeManager();
  }
}
