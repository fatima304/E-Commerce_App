import 'package:ecommerce_app/core/routes/app_routing.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key, required this.appRouting});

  final AppRouting appRouting;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
