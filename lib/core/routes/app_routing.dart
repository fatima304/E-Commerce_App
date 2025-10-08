import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forgot_pass.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/coupons/coupon_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/manager/address/address_cubit.dart';
import 'package:ecommerce_app/features/orders/presentation/screens/address_screen.dart';
import 'package:ecommerce_app/features/orders/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/orders/presentation/screens/order_confirmation_screen.dart';
import 'package:ecommerce_app/features/home/data/models/products/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_cubit.dart';
import 'package:ecommerce_app/features/details/presentation/screens/details_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route? generateRoute(RouteSettings routesSettings) {
    switch (routesSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
       case Routes.forgotPassScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CategoryCubit>()..fetchCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<ProductCubit>()..fetchProducts(),
              ),
            ],
            child: HomeScreen(),
          ),
        );
      case Routes.detailsScreen:
        final product = routesSettings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: DetailsScreen(product: product),
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<CartCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CouponCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AddressCubit>()..fetchAddresses(),
              ),
            ],
            child: const CartScreen(),
          ),
        );
 case Routes.addressScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AddressCubit>(),
            child: const AddressScreen(),
          ),
        );
      case Routes.orderConfirmationScreen:
        return MaterialPageRoute(
          builder: (_) => const OrderConfirmationScreen(),
        );
    }
    return null;
  }
}
