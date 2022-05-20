import 'package:flutter/foundation.dart';

import '../data/service_locator.dart';
import '../data/utils/response.dart';
import '../model/doc_list_res.dart';
import '../repositories/doc_list_repository.dart';

class DocViewModel extends ChangeNotifier {

  final DocProfileRepository _docProfileRepository = serviceLocator<DocProfileRepository>();

  Response<List<DocListRes>> listofbooks = Response<List<DocListRes>>();



  void loadDocProfileList() async {
    _setListOfBooks(Response.loading<List<DocListRes>>());
    try {
      print("HHHH _setListOfBooks INSIDE");
      await _docProfileRepository
          .fetchDocList()
          .then((value) => _setListOfBooks(Response.complete<List<DocListRes>>(value)));
    } catch (exception) {
      _setListOfBooks(Response.error<List<DocListRes>>(exception.toString()));
    }
  }

  void _setListOfBooks(Response response) {
    print("HHHH _setListOfBooks${response.state}");
    if(response.data!=null) {
      listofbooks = response.data;
    }
    notifyListeners();
  }
}
