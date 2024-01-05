import 'package:dog_images/features/dogs_list/presentation/screens/dog_image_list_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_random_image_screen.dart';
import 'package:dog_images/features/dogs_list/presentation/screens/dog_list_screen.dart';
import 'package:dog_images/l10n/app_localizations.dart';
import 'package:dog_images/utils/state_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: 'lContext.loc.appTitle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        initialRoute: DogListScreen.routePath,
        routes: {
          DogListScreen.routePath: (context) => const DogListScreen(),
          DogImageListScreen.routePath: (context) => const DogImageListScreen(),
          DogRandomImageScreen.routePath: (context) =>
              const DogRandomImageScreen(),
        },
      );
    });
  }
}
