part of values;

class FontFamily {
  static const dmSansBold = "DMSans-Bold";
  static const dmSansBoldItalic = "DMSans-BoldItalic";
  static const dmSansMedium = "DMSans-Medium";
  static const dmSansMediumItalic = "DMSans-MediumItalic";
  static const dmSansRegular = "DMSans-Regular";
  static const dmSansRegularItalic = "DMSans-RegularItalic";
}

class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;

  static double displayLarge(BuildContext context) => responsiveSize(
        context,
        lg: 37 * scale,
        md: 32 * scale,
        sm: 28 * scale,
        xs: 24 * scale,
      );

  static double displayMedium(BuildContext context) => responsiveSize(
        context,
        lg: 32 * scale,
        md: 28 * scale,
        sm: 24 * scale,
        xs: 22 * scale,
      );

  static double displaySmall(BuildContext context) => responsiveSize(
        context,
        lg: 28 * scale,
        md: 24 * scale,
        sm: 22 * scale,
        xs: 20 * scale,
      );

  static double headlineLarge(BuildContext context) => responsiveSize(
        context,
        lg: 30 * scale,
        sm: 28 * scale,
        xs: 26 * scale,
      );

  static double headlineMedium(BuildContext context) => responsiveSize(
        context,
        lg: 26 * scale,
        xs: 24 * scale,
      );

  static double headlineSmall(BuildContext context) => responsiveSize(
        context,
        lg: 22 * scale,
      );

  static double titleLarge(BuildContext context) =>
      responsiveSize(context, lg: 24 * scale);

  static double titleMedium(BuildContext context) =>
      responsiveSize(context, lg: 22 * scale);

  static double titleSmall(BuildContext context) =>
      responsiveSize(context, lg: 20 * scale);

  static double bodyLarge(BuildContext context) => responsiveSize(
        context,
        lg: 18 * scale,
        md: 18 * scale,
        sm: 17 * scale,
        xs: 16 * scale,
      );

  static double bodyMedium(BuildContext context) => responsiveSize(
        context,
        lg: 16 * scale,
        xs: 15 * scale,
      );

  static double bodySmall(BuildContext context) =>
      responsiveSize(context, lg: 14 * scale);

  static double labelLarge(BuildContext context) =>
      responsiveSize(context, lg: 14 * scale);

  static double labelMedium(BuildContext context) =>
      responsiveSize(context, lg: 12 * scale);

  static double labelSmall(BuildContext context) =>
      responsiveSize(context, lg: 11 * scale);
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;

  static const double pageContentPadding = 16;
  static const double pageMargin = 40;

  static double getPageContentPadding(BuildContext context) =>
      responsiveSize(context, lg: pageContentPadding);
  static double getPageContentMargin(BuildContext context) =>
      responsiveSize(context, lg: pageMargin);

  static double get xxs => 4 * scale;

  static double get xs => 8 * scale;

  static double get sm => 12 * scale;

  static double get xxMd => 16 * scale;

  static double get xMd => 20 * scale;

  static double get md => 24 * scale;

  static double get lg => 30 * scale;

  static double get xl => 40 * scale;

  static double get xxl => 60 * scale;

  // Regular padding Values
  static double get paddingXxs => 4 * scale;

  static double get paddingXs => 8 * scale;

  static double get paddingSm => 12 * scale;

  static double get paddingXxMd => 16 * scale;

  static double get paddingXMd => 20 * scale;

  static double get paddingMd => 24 * scale;

  static double get paddingLg => 30 * scale;

  static double get paddingXl => 36 * scale;

  static double get paddingXxl => 48 * scale;
}

class Corners {
  static const double xs = 4;
  static const Radius xsRadius = Radius.circular(xs);
  static const BorderRadius xsBorder = BorderRadius.all(xsRadius);

  static const double sm = 8;
  static const Radius smRadius = Radius.circular(sm);
  static const BorderRadius smBorder = BorderRadius.all(smRadius);

  static const double md = 16;
  static const Radius mdRadius = Radius.circular(md);
  static const BorderRadius mdBorder = BorderRadius.all(mdRadius);

  static const double lg = 20;
  static const Radius lgRadius = Radius.circular(lg);
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);

  static const double xl = 30;
  static const Radius xlRadius = Radius.circular(xl);
  static const BorderRadius xlBorder = BorderRadius.all(xlRadius);

  static const double xxLg = 40;
  static const Radius xxLgRadius = Radius.circular(xxLg);
  static const BorderRadius xxLgBorder = BorderRadius.all(xxLgRadius);
}

class ButtonSizes {
  static const double heightLg = 54;
  static const double heightXs = 48;

  static double defaultButtonSize(BuildContext context) =>
      responsiveSize(context,
          xl: heightLg, lg: heightLg, md: heightLg, xs: heightXs);
}

class IconSizes {
  static const double scale = 1;

  static const double xxs = 12;
  static const double xs = 16;
  static const double sm = 20;
  static const double md = 24;
  static const double lg = 40;
  static const double xl = 80;

  static double defaultIconSize(BuildContext context) =>
      responsiveSize(context, xl: md, lg: md);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Thickness {
  static const double none = 0;
  static const double thin = 0.5;
  static const double normal = 1;
  static const double medium = 1.5;
  static const double large = 2;
}
