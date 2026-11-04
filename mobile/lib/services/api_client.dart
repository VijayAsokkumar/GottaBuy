import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/receipt.dart';
import '../models/inventory_item.dart';

class ApiClient {
  final String baseUrl;
  final http.Client _http;
  ApiClient({required this.baseUrl, http.Client? client}) : _http = client ?? http.Client();
  Future<void> saveReceipt(Receipt receipt) async {
    final response = await _http.post(Uri.parse('$baseUrl/purchases'),
      headers: {'Content-Type':'application/json'}, body: jsonEncode(receipt.toJson()));
    if (response.statusCode != 201) throw Exception('Purchase save failed: ${response.statusCode}');
  }
  Future<List<InventoryItem>> loadInventory() async {
    final response = await _http.get(Uri.parse('$baseUrl/inventory'));
    if (response.statusCode != 200) throw Exception('Inventory fetch failed: ${response.statusCode}');
    final rows = jsonDecode(response.body) as List<dynamic>;
    return rows.map((row) => InventoryItem.fromJson(row as Map<String,dynamic>)).toList();
  }
  Future<List<Map<String,dynamic>>> loadPrices(String productName) async {
    final path = Uri.encodeComponent(productName);
    final response = await _http.get(Uri.parse('$baseUrl/prices/$path'));
    if (response.statusCode != 200) throw Exception('Price fetch failed: ${response.statusCode}');
    return (jsonDecode(response.body) as List<dynamic>).cast<Map<String,dynamic>>();
  }
  void dispose() => _http.close();
}
