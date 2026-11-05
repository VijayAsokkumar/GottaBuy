import 'receipt.dart';

class Purchase {
  final String id;
  final Receipt receipt;
  const Purchase({required this.id, required this.receipt});
  // TODO: parse persisted purchase IDs returned by the backend.
}
