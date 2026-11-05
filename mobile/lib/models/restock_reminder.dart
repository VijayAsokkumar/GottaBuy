class RestockReminder {
  final String productName;
  final DateTime dueAt;
  final int intervalDays;
  const RestockReminder({required this.productName, required this.dueAt,
    required this.intervalDays});
  bool isDue(DateTime now) => !dueAt.isAfter(now);
}
