class PriceComparisonService {
  /// TODO: implement normalization across packs, units and currencies.
  /// Historical receipt price != current shelf price.
  Map<String, dynamic>? cheapestComparable(List<Map<String, dynamic>> offers) {
    if (offers.isEmpty) return null;
    final units = offers.map((o) => '${o['currency']}/${o['unit']}').toSet();
    if (units.length != 1) return null;
    final sorted = [...offers]..sort((a,b) =>
      (a['unit_price'] as num).compareTo(b['unit_price'] as num));
    return sorted.first;
  }
}
