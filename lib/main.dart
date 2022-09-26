import 'package:flutter/material.dart';
import 'package:quitandavirtual/auth/signin_screen.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quitandinha Virtual',
      theme: ThemeData(
       primarySwatch: Colors.green,
       scaffoldBackgroundColor: CustomColors.customWhiteColor
      ),
      home: const SplashScreen(),
    );
  }
}
