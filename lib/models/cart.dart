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
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation({
    required this.item,
  });
   
  @override
  void perform(){
    store?.cartModel._itemIDs.remove(item.id);

  }
}
