import 'package:flutter/material.dart';

class DogImageListScreen extends StatelessWidget {
  const DogImageListScreen({super.key});

  /// Named route for [DogImageListScreen]
  static const String routePath = '/dogImageList';

  /// Named route for the [DogImageListScreen]
  static const routeName = 'dog-image-list-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Dog Image List"),
      ),
    );
  }
}
