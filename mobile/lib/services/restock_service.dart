import '../models/restock_reminder.dart';

class RestockService {
  // TODO: infer intervals from validated purchase history and persist reminders.
  RestockReminder schedule(String productName, DateTime lastPurchased,
      int intervalDays) {
    if (intervalDays < 1) throw ArgumentError('intervalDays must be positive');
    return RestockReminder(productName: productName,
      dueAt: lastPurchased.add(Duration(days: intervalDays)),
      intervalDays: intervalDays);
  }
}
