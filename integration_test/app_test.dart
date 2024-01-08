import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dog_images/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    "end to end test",
    () {
      // test to load dog breeds lists
      testWidgets(
        "load dog list screen, verify if dog breeds have been fetched",
        (tester) async {
          // Arrange
          app.main();

          // item to be found
          final expansionTileItem = find.byKey(const Key("african"));

          // Act
          // Wait for the screen to load
          // poll till network call is completed
          await pumpUntilFound(tester, expansionTileItem);

          // Assert
          // Check if breeds are loaded
          expect(expansionTileItem, findsOneWidget);
        },
      );

      // // test to to see if a random image is being loaded
      testWidgets(
        "tap on random image icon, verify if random image is loaded",
        (tester) async {
          // Arrange
          app.main();

          final expansionTileItem = find.byKey(const Key("african"));
          // Act
          // Wait for the screen to load
          // poll till network call is completed
          await pumpUntilFound(tester, expansionTileItem);

          // Tap on button, to navigate to DogRandomImageScreen
          await tester.tap(find.byType(IconButton).at(0));

          final imageItem = find.byType(CachedNetworkImage);
          // poll till network call has completed fetching a random image
          // of the selected breed or sub-breed
          await pumpUntilFound(tester, imageItem);


          // Assert
          // Check if random image is loaded
          expect(imageItem, findsOneWidget);
        },
      );

      // test to to see if an image list is being loaded
      testWidgets(
        "tap on image list icon, verify if image list are loaded",
        (tester) async {
          // Arrange
          app.main();

          final expansionTileItem = find.byKey(const Key("african"));
          // Act
          // Wait for the screen to load
          // poll till network call is completed
          await pumpUntilFound(tester, expansionTileItem);

          // Tap on button, to navigate to DogImageListScreen
          await tester.tap(find.byType(IconButton).at(1));

          final imageItem = find.byType(CachedNetworkImage);

          // poll till network call has completed fetching image list
          // of the selected breed or sub-breed
          await pumpUntilFound(tester, imageItem);

          // Assert
          // Check if image list is loaded
          expect(find.byType(CachedNetworkImage).at(0), findsOneWidget);
        },
      );
    },
  );
}


Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
      Duration timeout = const Duration(seconds: 10),
    }) async {
  bool timerDone = false;
  final timer = Timer(timeout, () => timerDone = true);
  while (timerDone != true) {
    await tester.pump();

    final found = tester.any(finder);
    if (found) {
      timerDone = true;
    }
  }
  timer.cancel();
}