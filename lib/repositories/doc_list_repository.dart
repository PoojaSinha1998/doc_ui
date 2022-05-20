import 'dart:async';

import 'package:doc_app/model/doc_list_res.dart';

import '../data/network/api_client.dart';
import '../data/service_locator.dart';

class DocProfileRepository {
  final ApiClient _apiClient = serviceLocator<ApiClient>();

  Future<List<DocListRes>> fetchDocList() async {
    print("NNNN");
    return await _apiClient.getRelationList();
  }


}
