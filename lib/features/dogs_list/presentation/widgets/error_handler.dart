import 'package:dog_images/config/values/values.dart';
import 'package:flutter/material.dart';

/// handles and shows errors - allows you to retry
class ErrorHandler extends StatelessWidget {
  const ErrorHandler({
    super.key,
    required this.message,
    this.messageStyle,
    this.handler,
  });

  /// shows error message
  final String message;

  /// callback to handle to retry the failed action
  final VoidCallback? handler;

  /// styling for [message]
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
