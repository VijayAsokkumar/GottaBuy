String formatPrice(num amount, {String currency = 'NZD'}) =>
    '$currency ${amount.toStringAsFixed(2)}';
