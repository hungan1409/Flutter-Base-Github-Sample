class DateTimeUtils {
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Check if two dates are in the same week.
  /// Week starts on Monday (ISO standard).
  static bool isSameWeek(DateTime a, DateTime b) {
    // Normalize to UTC midnight
    final dateA = DateTime.utc(a.year, a.month, a.day);
    final dateB = DateTime.utc(b.year, b.month, b.day);

    final diff = dateA.difference(dateB).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    final min = dateA.isBefore(dateB) ? dateA : dateB;
    final max = dateA.isBefore(dateB) ? dateB : dateA;

    // Dart weekday: Monday=1, Sunday=7
    // If max.weekday >= min.weekday → Same week
    return max.weekday >= min.weekday;
  }
}
