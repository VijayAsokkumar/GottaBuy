bool validQuantity(num value) => value.isFinite && value > 0;

String normalizeProductName(String input) => input.trim().replaceAll(RegExp(r'\s+'), ' ');
