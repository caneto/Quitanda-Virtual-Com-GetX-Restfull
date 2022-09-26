import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/splash/splash_screen.dart';
import 'package:quitandavirtual/src/pages_route/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quitandinha Virtual',
      theme: ThemeData(
       primarySwatch: Colors.green,
       scaffoldBackgroundColor: CustomColors.customWhiteColor
      ),

      initialRoute: PagesRoutes.splashRoute,

      getPages: AppPages.pages,
    );
  }
}
