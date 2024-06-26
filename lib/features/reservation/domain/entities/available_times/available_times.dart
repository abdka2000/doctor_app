class AvailableTimes {
  final String? fromTime;
  final String? toTime;
  final bool? isBooked;
  final bool? isSetUnavailable;

  AvailableTimes(
      {required this.fromTime,
      required this.toTime,
      required this.isBooked,
      required this.isSetUnavailable});
}
