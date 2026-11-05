import '../models/shopping_list_item.dart';

class ShoppingListService {
  // Local, in-memory prototype. TODO: persist per-user lists in Supabase.
  final List<ShoppingListItem> _items = [];
  List<ShoppingListItem> get items => List.unmodifiable(_items);
  void add(String productName) {
    final name = productName.trim();
    if (name.isEmpty) throw ArgumentError('Product name is required');
    _items.add(ShoppingListItem(productName: name));
  }
  void markPurchased(int index, bool purchased) {
    _items[index] = _items[index].copyWith(purchased: purchased);
  }
  void remove(int index) => _items.removeAt(index);
}
