class ReceiptLine {
  final String productName;
  final double quantity;
  final String unit;
  final double totalPrice;
  const ReceiptLine({required this.productName, required this.quantity,
    this.unit = 'each', required this.totalPrice});
  Map<String, dynamic> toJson() => {'product_name': productName,
    'quantity': quantity, 'unit': unit, 'total_price': totalPrice};
}

class Receipt {
  final String storeName;
  final String purchasedAt;
  final List<ReceiptLine> lines;
  const Receipt({required this.storeName, required this.purchasedAt, required this.lines});
  Map<String, dynamic> toJson() => {'store_name': storeName,
    'purchased_at': purchasedAt, 'currency': 'NZD',
    'items': lines.map((line) => line.toJson()).toList()};
}
