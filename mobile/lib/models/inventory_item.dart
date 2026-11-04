class InventoryItem {
  final String name;
  final double quantity;
  final String unit;
  const InventoryItem({required this.name, required this.quantity, required this.unit});
  factory InventoryItem.fromJson(Map<String, dynamic> json) => InventoryItem(
    name: json['product_name'] as String,
    quantity: (json['quantity'] as num).toDouble(), unit: json['unit'] as String);
}
