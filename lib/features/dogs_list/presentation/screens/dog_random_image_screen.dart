import 'package:flutter/material.dart';

class DogRandomImageScreen extends StatelessWidget {
  const DogRandomImageScreen({super.key});

  /// Named route for [DogRandomImageScreen]
  static const String routePath = '/dogRandomImage';

  /// Named route for the [DogRandomImageScreen]
  static const routeName = 'dog-random-image-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Random Image Gen"),
      ),
    );
  }
}
