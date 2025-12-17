class EmailUtils {
  static const emailRegex =
      r'^([\w\d\-\+]+)(\.+[\w\d\-\+%]+)*@([\w\-]+\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})$';

  ///
  /// Checks whether the given string [s] is a email address
  ///
  static bool isEmail(String s) {
    final regExp = RegExp(emailRegex);
    return regExp.hasMatch(s);
  }
}
