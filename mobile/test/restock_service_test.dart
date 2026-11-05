import 'package:flutter_test/flutter_test.dart';
import 'package:gottabuy/services/restock_service.dart';

void main() {
  test('calculates due date from interval', () {
    final result = RestockService().schedule('Milk', DateTime(2026, 11, 1), 7);
    expect(result.dueAt, DateTime(2026, 11, 8));
  });
  test('rejects invalid interval', () {
    expect(() => RestockService().schedule('Milk', DateTime(2026), 0), throwsArgumentError);
  });
}
