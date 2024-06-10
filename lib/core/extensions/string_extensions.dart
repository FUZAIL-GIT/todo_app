extension StringExtension on String {
  /// Returns the complete email address if the string does not contain '@'
  /// else returns the string itself.
  /// Helps to get the complete email address from the user input.
  String get emailText => contains('@') ? trim() : '${trim()}@gmail.com';
}
