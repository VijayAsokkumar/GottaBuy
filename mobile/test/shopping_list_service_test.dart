import 'package:flutter_test/flutter_test.dart';
import 'package:gottabuy/services/shopping_list_service.dart';

void main() {
  test('adds and completes shopping items', () {
    final service = ShoppingListService();
    service.add('Milk');
    expect(service.items.single.productName, 'Milk');
    service.markPurchased(0, true);
    expect(service.items.single.purchased, isTrue);
  });
  test('rejects blank names', () {
    final service = ShoppingListService();
    expect(() => service.add('  '), throwsArgumentError);
  });
}
