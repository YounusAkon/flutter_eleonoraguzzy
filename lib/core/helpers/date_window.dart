/// Date rules used by date-based content lists.
///
/// The lower bound is seven calendar days before today. There is no upper
/// bound, so today's and all future records are included.
abstract final class DateWindow {
  static DateTime get lowerBound {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return today.subtract(const Duration(days: 7));
  }

  static DateTime? parse(Object? value) {
    if (value is DateTime) return value.toLocal();
    if (value is! String || value.trim().isEmpty) return null;

    return DateTime.tryParse(value.trim())?.toLocal();
  }

  static bool includes(Object? value) {
    final date = parse(value);
    if (date == null) return false;

    final calendarDate = DateTime(date.year, date.month, date.day);
    return !calendarDate.isBefore(lowerBound);
  }

  /// Includes an event if it is ongoing, starts in the window, or ends in the
  /// window. A missing end date is treated as a one-day event.
  static bool includesRange(Object? start, Object? end) {
    final startDate = parse(start);
    final endDate = parse(end) ?? startDate;
    if (endDate == null) return false;

    final lastCalendarDate = DateTime(endDate.year, endDate.month, endDate.day);
    return !lastCalendarDate.isBefore(lowerBound);
  }
}
