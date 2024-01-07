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

          // Act
          // Wait for the screen to load
          await tester.pumpAndSettle();

          // Trigger a frame when a network call is made to fetch dog breeds
          await tester.pumpAndSettle();

          // Assert
          // Check if breeds are loaded
          expect(find.byType(ExpansionTile).at(0), findsOneWidget);
        },
      );

      // test to to see if a random image is being loaded
      testWidgets(
        "tap on random image icon, verify if random image is loaded",
        (tester) async {
          // Arrange
          app.main();

          // Act
          // Wait for the screen to load
          await tester.pumpAndSettle();

          // Trigger a frame when a network call is made to fetch dog breeds
          await tester.pumpAndSettle();

          // Tap on button, to navigate to DogRandomImageScreen
          await tester.tap(find.byType(IconButton).at(0));

          // Wait for the DogRandomImageScreen to load
          await tester.pumpAndSettle();

          // Trigger a frame when a network call is made to fetch random dog breed image of the breed selected
          await tester.pumpAndSettle();

          // Assert
          // Check if random image is loaded
          expect(find.byType(CachedNetworkImage), findsOneWidget);
        },
      );

      // test to to see if an image list is being loaded
      testWidgets(
        "tap on image list icon, verify if image list are loaded",
        (tester) async {
          // Arrange
          app.main();

          // Act
          // Wait for the screen to load
          await tester.pumpAndSettle();

          // Trigger a frame when a network call is made to fetch dog breeds
          await tester.pumpAndSettle();

          // Tap on button, to navigate to DogImageListScreen
          await tester.tap(find.byType(IconButton).at(1));

          // Wait for the DogImageListScreen to load
          await tester.pumpAndSettle();

          // Trigger a frame when a network call is made to fetch image list of the dog breed selected
          await tester.pumpAndSettle();

          // Assert
          // Check if an image is loaded
          expect(find.byType(CachedNetworkImage).at(0), findsOneWidget);
        },
      );
    },
  );
}
