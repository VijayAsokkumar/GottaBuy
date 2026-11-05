import 'receipt.dart';

class ScanResult {
  final Receipt? receipt;
  final List<String> warnings;
  const ScanResult({this.receipt, this.warnings = const []});
  bool get needsReview => warnings.isNotEmpty || receipt == null;
}
