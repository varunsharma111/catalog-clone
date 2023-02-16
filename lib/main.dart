import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_busy/models/product_model.dart';
import 'package:oye_busy/routs/routes.dart';
import 'package:oye_busy/screens/HOMEDETAILPAGE.dart';
import 'package:oye_busy/screens/login_screen.dart';
import 'screens/catalog_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey ='pk_test_51LpRuoSAOViHI2MVCTYvk8loAOVODOhjApTZ2hbPrsbjeNO4dmmQnISthdauw0JPB7OnjHwfeTvtrRn7EgXZ3cck00vsZh4P0Z';

  runApp(GetMaterialApp(home : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
    primarySwatch: Colors.lightBlue,
    ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context)=> LoginPage(),
        MyRoutes.loginRoute: (context)=> LoginPage(),
        MyRoutes.homeRoute: (context)=> CatalogScreen(),

      },
    );
  }
}
