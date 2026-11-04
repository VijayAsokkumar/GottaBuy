import '../models/receipt.dart';

class ReceiptScanner {
  /// TODO: implement image capture/OCR, then let user review extracted lines.
  /// Never auto-save uncertain OCR output without user confirmation.
  Future<Receipt> scanReceipt() async => throw UnimplementedError(
    'Camera/OCR is not implemented. Use Add Demo Receipt until this feature is built.');

  Receipt demoReceipt() => const Receipt(storeName: 'Example Supermarket',
    purchasedAt: '2026-11-04', lines: [
      ReceiptLine(productName: 'Milk', quantity: 2, unit: 'L', totalPrice: 6.20),
      ReceiptLine(productName: 'Rice', quantity: 1, unit: 'kg', totalPrice: 3.50),
    ]);
}
