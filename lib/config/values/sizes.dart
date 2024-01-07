part of values;


class Insets {
  static double scale = 1;
  static double offsetScale = 1;

  static double get xxs => 4 * scale;

  static double get xs => 8 * scale;

  static double get sm => 12 * scale;

  // Regular padding Values
  static double get paddingXxs => 4 * scale;

  static double get paddingXs => 8 * scale;

  static double get paddingSm => 12 * scale;
}

class Corners {
  static const double xs = 4;
  static const Radius xsRadius = Radius.circular(xs);
  static const BorderRadius xsBorder = BorderRadius.all(xsRadius);

  static const double sm = 8;
  static const Radius smRadius = Radius.circular(sm);
  static const BorderRadius smBorder = BorderRadius.all(smRadius);

}
