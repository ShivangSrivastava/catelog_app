// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/catalog.dart';

class CartModel {
  late CatalogModel catalog;

  final List<int> _itemIDs = [];

  List<Item> get items =>
      _itemIDs.map((id) => catalog.getItemById(id)).toList();

  double get totalPrice =>
      _itemIDs.fold(0.0, (sum, id) => sum + catalog.getItemById(id).price);

  addItem(Item item) {
    _itemIDs.add(item.id);
  }

  void removeItem(Item item) {
    _itemIDs.remove(item.id);
  }

  bool isItemInCart(int id) {
    return _itemIDs.contains(id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });
  
  @override
  void perform(){
    store?.cartModel._itemIDs.add(item.id);

  }
}
