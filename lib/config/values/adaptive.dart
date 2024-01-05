part of values;


enum DisplayType {
  desktop,
  mobile,
  tablet,
}

const _desktopPortraitBreakpoint = 700.0;
const _desktopLandscapeBreakpoint = 1000.0;
const ipadProBreakpoint = 1000.0;

/// Returns the [DisplayType] for the current screen. This app only supports
/// mobile and desktop layouts, and as such we only have one breakpoint.
DisplayType displayTypeOf(BuildContext context) {
  final orientation = MediaQuery
      .of(context)
      .orientation;
  final width = MediaQuery
      .of(context)
      .size
      .width;

  if ((orientation == Orientation.landscape &&
      width > _desktopLandscapeBreakpoint) ||
      (orientation == Orientation.portrait &&
          width > _desktopPortraitBreakpoint)) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

/// Returns a boolean if we are in a display of [DisplayType.desktop]. Used to
/// build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) {
  return displayTypeOf(context) == DisplayType.desktop;
}

/// Returns a boolean if we are in a display of [DisplayType.mobile]. Used to
/// build adaptive and responsive layouts.
bool isDisplayMobile(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .width <=
      const RefinedBreakpoints().tabletSmall;
}

/// Returns a boolean if we are in a display of [DisplayType.mobile] or [DisplayType.tablet]. Used to
/// build adaptive and responsive layouts.
bool isDisplayMobileOrTablet(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .width <=
      const RefinedBreakpoints().tabletNormal;
}

/// Returns a boolean if we are in a display of [DisplayType.desktop] but less
/// than [_desktopLandscapeBreakpoint] width. Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery
          .of(context)
          .size
          .width < _desktopLandscapeBreakpoint;
}

bool isDisplaySmallDesktopOrIpadPro(BuildContext context) {
  return isDisplaySmallDesktop(context) ||
      (MediaQuery
          .of(context)
          .size
          .width > ipadProBreakpoint &&
          MediaQuery
              .of(context)
              .size
              .width < 1170);
}

double widthOfScreen(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .width;
}

double heightOfScreen(BuildContext context) {
  return MediaQuery
      .of(context)
      .size
      .height;
}


double responsiveSize(BuildContext context, {
  required double lg,
  double? xl,
  double? md,
  double? sm,
  double? xs,
}) {
  return context.layout.value(
    lg: lg,
    xl: xl ?? lg,
    md: md ?? lg,
    sm: sm ?? (md ?? lg),
    xs: xs ?? (sm ?? md ?? lg),
  );
}

