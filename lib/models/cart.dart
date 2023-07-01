import 'package:catelog_app/models/catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

// collection of ids - store ids of each item
  final List<int> _itemIDs = [];
  //  getter for the _catalog
  CatalogModel get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel catalog) => _catalog = catalog;

// get items in the cart
  List<Item> get items =>
      _itemIDs.map((id) => _catalog.getItemById(id)).toList();

// get total price
  double get totalPrice =>
      _itemIDs.fold(0.0, (sum, id) => sum + _catalog.getItemById(id).price);

// add item to cart
  void addItem(Item item) {
    _itemIDs.add(item.id);
  }

  // remove item from cart
  void removeItem(Item item) {
    _itemIDs.remove(item.id);
  }
}
