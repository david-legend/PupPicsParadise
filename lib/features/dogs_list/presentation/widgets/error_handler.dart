import 'package:dog_images/config/values/values.dart';
import 'package:dog_images/l10n/app_localizations_context.dart';
import 'package:flutter/material.dart';

/// handles and shows errors - allows you to retry
class ErrorHandler extends StatelessWidget {
  const ErrorHandler({
    super.key,
    required this.message,
     this.action,
    this.messageStyle,
    this.actionStyle,
    this.handler,
  });

  /// shows error message
  final String message;
  final String? action;

  /// callback to handle to retry the failed action
  final VoidCallback? handler;

  /// styling for [message]
  final TextStyle? messageStyle;
  final TextStyle? actionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_off),
        SizedBox(height: Insets.sm),
        Text(
          message,
          textAlign: TextAlign.center,
          style: messageStyle ?? Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: Insets.sm),
        ElevatedButton(
          onPressed: handler,
          child: Text(
            action ?? context.loc.retry,
            textAlign: TextAlign.center,
            style: actionStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
