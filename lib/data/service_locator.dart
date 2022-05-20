
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../repositories/doc_list_repository.dart';
import '../view_model/doc_view_model.dart';
import 'network/api_client.dart';

// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  print("HHHH");
  serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient(httpClient: http.Client()));

  serviceLocator.registerLazySingleton<DocProfileRepository>(() => DocProfileRepository());

  // view models
  serviceLocator.registerFactory<DocViewModel>(() => DocViewModel());

}
