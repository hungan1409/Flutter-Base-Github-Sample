class ColorUtils {
  ///
  /// Converts the given [hex] color string to the corresponding int.
  ///
  /// Note that when no alpha/opacity is specified, 0xFF is assumed.
  ///
  static int hexToInt(String hex) {
    final hexDigits = hex.startsWith('#') ? hex.substring(1) : hex;
    final hexMask = hexDigits.length <= 6 ? 0xFF000000 : 0;
    final hexValue = int.parse(hexDigits, radix: 16);
    assert(hexValue >= 0 && hexValue <= 0xFFFFFFFF);
    return hexValue | hexMask;
  }

  ///
  /// Converts the given integer [i] to a hex string with a leading #.
  ///
  /// Note that only the RGB values will be returned (like #RRGGBB), so
  /// and alpha/opacity value will be stripped.
  ///
  static String intToHex(int i) {
    assert(i >= 0 && i <= 0xFFFFFFFF);
    return '#${(i & 0xFFFFFF | 0x1000000).toRadixString(16).substring(1).toUpperCase()}';
  }
}
