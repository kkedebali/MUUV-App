import 'package:MUUV/core/consts/apiConstants.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),

          queryParameters: {
            'api_key': ApiConstants.apiKey,
            'language': 'tr-TR',
          },
        ),
      );
  Dio get dio => _dio;
}
