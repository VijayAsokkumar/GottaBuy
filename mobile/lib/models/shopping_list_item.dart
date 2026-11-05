class ShoppingListItem {
  final String productName;
  final double quantity;
  final String unit;
  final bool purchased;
  const ShoppingListItem({required this.productName, this.quantity = 1,
    this.unit = 'each', this.purchased = false});
  ShoppingListItem copyWith({bool? purchased}) => ShoppingListItem(
    productName: productName, quantity: quantity, unit: unit,
    purchased: purchased ?? this.purchased);
}
