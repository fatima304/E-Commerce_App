import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_routing.dart';

void main() async {
  
  await setup();
  runApp(
    EcommerceApp(
      appRouting: AppRouting(),
    ),
  );
}
