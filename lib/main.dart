import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/l10n/app_localizations.dart';
import 'package:dog_images/utils/state_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    UncontrolledProviderScope(
      container: ProviderContainer(
        overrides: [],
        observers: [const StateLogger()],
      ),
      child: const MyApp(),
    ),
  );
}

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (lContext) {
      return MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme:  TextTheme(
            headlineSmall: GoogleFonts.karla(),
            titleMedium: GoogleFonts.karla(),
            titleLarge: GoogleFonts.karla(),
          )
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        initialRoute: DogListScreen.routePath,
        routes: {
          DogListScreen.routePath: (context) => const DogListScreen(),
        },
        onGenerateRoute: (settings) {
          // Cast the arguments to the correct type
          // and pass the arguments data to the correct screen.
          if (settings.name == DogRandomImageScreen.routePath) {
            return MaterialPageRoute(
              builder: (context) {
                return DogRandomImageScreen(
                  dogType: settings.arguments as DogType,
                );
              },
            );
          }
          if (settings.name == DogImageListScreen.routePath) {
            return MaterialPageRoute(
              builder: (context) {
                return DogImageListScreen(
                  dogType: settings.arguments as DogType,
                );
              },
            );
          }
          return null;
        },
      );
    });
  }
}
