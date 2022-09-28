import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitandavirtual/src/config/custom_colors.dart';
import 'package:quitandavirtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitandavirtual/src/pages_route/app_pages.dart';
import 'package:quitandavirtual/src/services/parseinit.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Parseinit parseinit = Parseinit();

  parseinit.parseInit();

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
