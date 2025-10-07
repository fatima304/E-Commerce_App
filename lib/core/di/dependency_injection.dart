import 'package:ecommerce_app/features/auth/data/network/auth_api_service.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:ecommerce_app/features/home/data/network/api_service.dart';
import 'package:ecommerce_app/features/home/domain/repo/home_repo.dart';
import 'package:ecommerce_app/features/home/presentation/manager/category/category_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/products/products_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //Dio
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  //Auth Api Service
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  //Auth Repo
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthApiService>()),
  );
  
  // Login Cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));

    // Register Cubit
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<AuthRepository>()));

    // VerifyOtp Cubit
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt<AuthRepository>()));

    //Api Service
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(getIt<Dio>()),
  );

  //Home Repo
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeApiService>()),
  );
  
  // Category Cubit
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt<HomeRepository>()));

  // Products Cubit
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt<HomeRepository>()));

}
