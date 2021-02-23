extension DateTimeFormatter on DateTime {
  String get formattedDate {
    return '${this.year}-${_pad(this.month)}-${_pad(this.day)}';
  }

  String _pad(int input) => input < 10 ? '0$input' : input.toString();
}
