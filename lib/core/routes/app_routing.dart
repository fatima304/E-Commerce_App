import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp.dart';
import 'package:ecommerce_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  Route? generateRoute(RouteSettings routesSettings) {
    final arguments = routesSettings.arguments;
    switch (routesSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
    case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
        case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
           case Routes.verifyOtpScreen:
        return MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(),
        );
    }
  }
}
