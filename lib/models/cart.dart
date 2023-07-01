import 'package:catelog_app/models/catalog.dart';

class CartModel {
  // singalton class
  static final CartModel _instance = CartModel._internal();
  CartModel._internal();
  factory CartModel() => _instance;

  // catalog field
  late CatalogModel catalog;

// collection of ids - store ids of each item
  final List<int> _itemIDs = [];

// get items in the cart
  List<Item> get items =>
      _itemIDs.map((id) => catalog.getItemById(id)).toList();

// get total price
  double get totalPrice =>
      _itemIDs.fold(0.0, (sum, id) => sum + catalog.getItemById(id).price);

// add item to cart
  addItem(Item item) {
    _itemIDs.add(item.id);
  }

  // remove item from cart
  void removeItem(Item item) {
    _itemIDs.remove(item.id);
  }

  bool isItemInCart(int id) {
    return _itemIDs.contains(id);
  }
}
