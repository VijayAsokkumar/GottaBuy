import '../models/purchase.dart';

class PurchaseHistoryService {
  // TODO: implement GET /purchases mapping and pagination in ApiClient.
  Future<List<Purchase>> loadHistory() => Future.error(
    UnimplementedError('Purchase history API mapping is not implemented.'));
}
