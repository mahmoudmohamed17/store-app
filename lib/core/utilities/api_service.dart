import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com/';
  Future<List<dynamic>> getAllProducts(
      {required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<List<dynamic>> getCategoryProducts(
      {required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
