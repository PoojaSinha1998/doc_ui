
import 'dart:io';
import 'package:doc_app/App.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'data/service_locator.dart';
import 'firebase_options.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHTTPclient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main()   async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // HttpOverrides.global = new MyHttpOverrides();
  // WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}


