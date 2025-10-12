import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_routing.dart';

void main() async {
  // Set up global error handling for image loading exceptions
  FlutterError.onError = (FlutterErrorDetails details) {
    // Suppress SVG and image loading errors
    if (details.exception.toString().contains('Invalid SVG data') ||
        details.exception.toString().contains('Bad state') ||
        details.exception.toString().contains('Image loading error') ||
        details.exception.toString().contains('HTTP request failed')) {
      // Log the error but don't crash the app
      debugPrint('Suppressed error: ${details.exception}');
      return;
    }
    // Let other errors be handled normally
    FlutterError.presentError(details);
  };

  await setupServiceLocator();
  runApp(
    EcommerceApp(
      appRouting: AppRouting(),
    ),
  );
}
