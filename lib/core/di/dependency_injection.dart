import 'package:ecommerce_app/features/auth/data/network/auth_api_service.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //Dio
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  //Api Service
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthApiService>()),
  );
  
  // Cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));
}
