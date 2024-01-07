part of values;

class AppTextStyles {
  static TextStyle? h1(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? h2(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? h3(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? h4(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge;
  }

  static TextStyle? h5(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? h6(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? h7(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 24,
          // color: AppColors.white,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle? h8(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 26,
          color: AppColors.white,
        );
  }

  static TextStyle? h9(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 25,
          color: AppColors.white,
        );
  }

  static TextStyle? h10(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 20,
          color: AppColors.white,
        );
  }

  static TextStyle? h11(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18);
  }

  static TextStyle? h12(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16);
  }

  static TextStyle? h13(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15);
  }

  static TextStyle? h14(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14);
  }

  static TextStyle? h15(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 12);
  }

  static TextStyle? b1M(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle? b2M(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? b3M(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 25);
  }

  static TextStyle? b4M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? b5M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);
  }

  static TextStyle? b6M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16);
  }

  static TextStyle? b7M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15);
  }

  static TextStyle? b71M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14);
  }

  static TextStyle? b8M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13);
  }

  static TextStyle? b9M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12);
  }

  static TextStyle? b10M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11);
  }

  static TextStyle? b11M(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 9);
  }

  static TextStyle? b1(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30);
  }

  static TextStyle? b2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 28);
  }

  static TextStyle? b3(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25);
  }

  static TextStyle? b4(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24);
  }

  static TextStyle? b5(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 22);
  }

  static TextStyle? b6(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? b7(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? b8(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? b9(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15);
  }

  static TextStyle? b10(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14);
  }

  static TextStyle? b11(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13);
  }

  static TextStyle? b12(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12);
  }

  static TextStyle? b13(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10);
  }

  static TextStyle? b1U(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 24,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b2U(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 18,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b3U(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 16,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b4U(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 14,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b5U(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 13,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b6U(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 12,
          decoration: TextDecoration.underline,
        );
  }

  static TextStyle? b1I(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontFamily: FontFamily.dmSansRegularItalic,
          fontSize: 12,
        );
  }
}
