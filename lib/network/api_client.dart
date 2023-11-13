import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final dio = Dio();

  sendRequest({required String path, required String method, body, header, queryParameters}) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };

    dio.options.validateStatus = (status) => true;
    dio.options.baseUrl = dotenv.env['API_URL'] as String;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.headers = headers;
    Response response;
    if (method == "post") {
      response = await dio.post(path, data: body);
    } else if (method == "get") {
      response = await dio.get(path, data: body, queryParameters: queryParameters);
    } else if (method == "put") {
      response = await dio.put(path, data: body);
    } else if (method == "delete") {
      response = await dio.delete(path, queryParameters: queryParameters);
    } else {
      throw Exception('Method not found');
    }

    return response;
  }
}
