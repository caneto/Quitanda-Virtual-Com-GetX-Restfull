

import 'package:get/get.dart';
import 'package:quitandavirtual/src/pages/auth/signin_screen.dart';
import 'package:quitandavirtual/src/pages/auth/signup_screen.dart';
import 'package:quitandavirtual/src/pages/base/home_screen.dart';
import 'package:quitandavirtual/src/pages/splash/splash_screen.dart';

abstract class AppPages{
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen()
    ),
    GetPage(
        name: PagesRoutes.signInRoute,
        page: () => const SignInScreen()
    ),
    GetPage(
        name: PagesRoutes.signUpRoute,
        page: () => SignUpScreen()
    ),
    GetPage(
        name: PagesRoutes.homeRoute,
        page: () => HomeScreen()
    )
  ];
}

abstract class PagesRoutes{
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String homeRoute = '/home';
}
