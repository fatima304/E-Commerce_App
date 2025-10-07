import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route? generateRoute(RouteSettings routesSettings) {
    final arguments = routesSettings.arguments;
    switch (routesSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.verifyOtpScreen:
        final userModel = routesSettings.arguments as RegisterRequestModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: VerifyOtpScreen(userModel: userModel),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
    return null;
  }
}
