import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
           final accessToken = await _getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
           if (e.response?.statusCode == 401) {
            final refreshed = await _refreshToken();

            if (refreshed) {
               final newAccessToken = await _getAccessToken();
              e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

              final cloneReq = await dio!.fetch(e.requestOptions);
              return handler.resolve(cloneReq);
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

   static Future<String?> _getAccessToken() async {
     return null;
  }

   static Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _getRefreshToken(); 
      

      final response = await dio!.post(
        'https://accessories-eshop.runasp.net/api/auth/refresh-token',
        data: {
          'refreshToken': refreshToken,
          'useCookies': false,
        },
      );

       final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];
      await _saveTokens(newAccessToken, newRefreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> _getRefreshToken() async {
     return null;
  }

  static Future<void> _saveTokens(String accessToken, String refreshToken) async {
   }
}
