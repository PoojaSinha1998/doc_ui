import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../model/doc_list_res.dart';
import '../utils/custom_exception.dart';

class ApiClient {
  final _baseUrl = 'https://5efdb0b9dd373900160b35e2.mockapi.io';


  final http.Client httpClient;

  ApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);


  Future<List<DocListRes>> getRelationList() async {
    final url = Uri.parse(
        '$_baseUrl + /contacts');
    try {
      final response = await this.httpClient.get(
        url
      );
      print("RESPONSE DATADATA ${url}");
      print("RESPONSE DATADATA ${response.body}");
      List<DocListRes> allRelationList = List<DocListRes>.from(
          _response(response).map((i) => DocListRes.fromJson(i)));
      return allRelationList;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }


  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
