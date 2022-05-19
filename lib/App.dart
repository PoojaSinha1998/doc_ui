
import 'package:doc_app/screens/doc_profile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_localizations.dart';

import 'auth/doc_home_page.dart';
import 'auth/login_screen.dart';
import 'auth/verification_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Widget _defaultHome = LoginScreen();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // builder: (context, child) {
      //   return ScrollConfiguration(
      //     behavior: MyBehavior(),
      //     child: child!,
      //   );
      // },
      debugShowCheckedModeBanner: false,
      title: 'Doc App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Quicksand',
          // bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent)
      ),
      routes: <String,WidgetBuilder>{
        'verification_screen' : (BuildContext context) => VerificationScreen(),
        'doc_home_page' : (BuildContext context)=>DocHomePage(),
        'doc_profile' :(BuildContext context) =>DocProfile()

      },
      home: _defaultHome,);
  }
}
// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildOverscrollIndicator(
//       BuildContext context, Widget child, ScrollableDetails details) {
//     return child;
//   }
// }