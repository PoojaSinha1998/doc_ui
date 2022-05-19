
import 'dart:io';
import 'package:doc_app/App.dart';
import 'package:flutter/material.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHTTPclient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main()  {

  // HttpOverrides.global = new MyHttpOverrides();
  // WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}


