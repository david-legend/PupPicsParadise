part of values;


/// Application-wide constants. Split into different areas: theme, layout and
class AppColors {
  // Background Colors
  static const background = Color(0xFFF9F5ED);
  static const onBackground = Color(0xFF1F1D1B);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  // PrimaryColors
  static const primary = Color(0xFFF9F5ED);
  static const onPrimary = Color(0xFF1F1D1B);
  static const primaryContainer = Color(0xFFECE8DF);
  static const onPrimaryContainer = Color(0xFF1F1D1B);

  //Secondary Colors
  static const secondary = Color(0xFFECE8DF);
  static const onSecondary = Color(0xFF1F1D1B);
  static const secondaryContainer = Color.fromRGBO(0,0,0,0.25);

  //Tertiary Colors
  static const tertiary = Color(0xFFDBD7CB);
  static const onTertiary = Color(0xFFF9F5ED);
  static const tertiaryContainer = Color(0xFFDBD7CB);

  //Tertiary Colors
  static const error = Color(0xFFEF5555);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFFFFF);
  static const onErrorContainer = Color(0xFFEF5555);

  //Surface Colors
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF000000);
  static const surfaceTint = Color(0xFF000000);

  // Surface Variant Colors
  static const surfaceVariant = Color(0xFFF2ECE1);
  static const onSurfaceVariant = Color(0xFF000000);

  // Inverse Colors
  static const inverseSurface = Color(0xFFF1C774);
  static const onInverseSurface = Color(0xFF000000);

  // Shadow
  static const shadow = Color(0xFF000000);
  // Icon Colors
  static const icon = Color(0xFF000000);
  static const iconOnPrimary = Color(0xFFFFFFFF);
  static const iconOnTertiary = Color(0xFFFFFFFF);
  static const iconOnSecondary = Color(0xFFFFFFFF);



  static const success = Color(0xFF55EFC4);
  static const danger = Color(0xFFD63031);
  static const warning = Color(0xFFF1C774);

  /// Green Colors
  static const lemonGreen = Color(0xFFBFD24B);

  /// Pink Colors
  static const pink = Color(0xFFE9A5AD);

  /// Orange Colors
  static const orange = Color(0xFFF18B3B);

  /// Yellow Colors
  static const yellow = Color(0xFFF2C551);

  /// Blue Colors
  static const blue = Color(0xFF6F7ADB);

  /// Turquoise Colors
  static const turquoise = Color(0xFF1EBFBF);


  /// Grey Colors
  static const grey100 = Color(0xFFF7F7F7);
  static const grey200 = Color(0xFFF0F0F0);
  static const grey300 = Color(0xFFCCCCCC);
  static const grey400 = Color(0xFFDBD7CB);
  static const grey800 = Color(0xFF6B6968);
  static const grey900 = Color(0xFF575757);



}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
