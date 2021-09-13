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

  Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    final response = await dio.get(url, queryParameters: query);
    return response;
  }

  Future<List<dynamic>> searchData(
      {required Map<String, dynamic> query}) async {
    final response =
        await dio.get(AppConstants.EVERYTHING, queryParameters: query);
    print(response.data['articles'][0]);
    return response.data['articles'];
  }
}
