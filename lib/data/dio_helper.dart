import 'package:dio/dio.dart';
import 'package:news_app/shared/constants.dart';

class DioHelper {
  static late Dio dio;

  static dioInit() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.BASE_URL,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }

  Future<Response> getData({required category}) async {
    final response = await dio.get(
      AppConstants.URL,
      queryParameters: {
        'country': 'eg',
        'category': category,
        'apiKey': AppConstants.API_KEY
      },
    );
    return response;
  }
}
