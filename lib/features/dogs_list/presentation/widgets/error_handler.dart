import 'package:dog_images/config/values/values.dart';
import 'package:flutter/material.dart';

class ErrorHandler extends StatelessWidget {
  const ErrorHandler({
    super.key,
    required this.message,
    this.messageStyle,
    this.handler,
  });

  final VoidCallback? handler;
  final String message;
  final TextStyle? messageStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.cloud_off),
        SizedBox(height: Insets.sm),
        TextButton(
          onPressed: handler,
          child: Text(
            message,
            style: messageStyle ?? Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
