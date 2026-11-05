class PriceOffer {
  final String storeName;
  final String currency;
  final String unit;
  final double unitPrice;
  final DateTime purchasedAt;
  const PriceOffer({required this.storeName, required this.currency,
    required this.unit, required this.unitPrice, required this.purchasedAt});
  factory PriceOffer.fromJson(Map<String, dynamic> json) => PriceOffer(
    storeName: json['store_name'] as String,
    currency: json['currency'] as String,
    unit: json['unit'] as String,
    unitPrice: (json['unit_price'] as num).toDouble(),
    purchasedAt: DateTime.parse(json['purchased_at'] as String));
}
