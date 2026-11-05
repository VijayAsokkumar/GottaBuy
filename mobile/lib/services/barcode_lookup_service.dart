import '../models/product.dart';

class BarcodeLookupService {
  // TODO: query Open Food Facts through a configured HTTPS client.
  // A barcode alone does not establish a store's current price.
  Future<Product?> lookup(String barcode) => Future.error(
    UnimplementedError('Barcode lookup is not implemented.'));
}
