import 'package:bunny/routes/app_page.dart';
import 'package:bunny/views/details_reproductions/detail_reproductions_page.dart';
import 'package:bunny/views/homepage/home_page.dart';
import 'package:bunny/views/listing/listing_page.dart';
import 'package:bunny/views/listing_reproductions/listing_reproductions_page.dart';
import 'package:bunny/views/login/login_page.dart';
import 'package:bunny/views/registers/register_coelho/register_coelho_page.dart';
import 'package:bunny/views/statics/statics_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bunny/views/registers/register_reproducao/register_reproducao_page.dart';
import 'package:bunny/views/registers/register_users/register_users_page.dart';
import 'package:bunny/views/splash/splash_page.dart';
import 'package:bunny/views/update/update_coelho.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      routes: {
        '/splash': (_) => SplashPage(),
        '/login': (_) => login(),
        '/home': (_) => const homepage(),
        '/addusers': (_) => register_users(),
        '/addcoelho': (_) => register_coelho(),
        '/listing': (_) => Listing(),
        '/updatecoelho': (_) => UpdateCoelho(),
        '/reproducao': (_) => register_reproducao(),
        '/statics_page': (_) => statics_page(),
        '/reproductionslisting_page': (_) => ListingReproductions(),
        '/detailsreproductions': (_) => DetailReproductions(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', ''),
      ],
    );
  }
}


/*
    
    GetMaterialApp(
      title: "Bunny App",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.Splash,
      getPages: AppPages.routes,
    );
    */