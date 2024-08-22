import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yachaq/utils/language.dart';
import 'package:flutter/services.dart';
import 'package:yachaq/splash.dart';


void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(Pension65());
  //Locale _currentLocale = const Locale(AppConfig.defaultLanguage, '');
}

class Pension65 extends StatelessWidget {
  const Pension65({super.key});
  // This widget is the root of your application.


/*
  List<Locale> getSupportedLocales() {
    List<Locale> locales = [];
    for (var element in AppConfig.supportedLanguage) {
      locales.add(Locale(element, ''));
    }
    return locales;
  }

 */


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(


        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('es'),
        ],


        debugShowCheckedModeBanner: false,
        //theme: ThemeData(fontFamily: 'Gotham'),
        home: SplashPage());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
