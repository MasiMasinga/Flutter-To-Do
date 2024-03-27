import 'package:flutter/material.dart';

// Screens
import 'package:to_do/screens/auth/forgot_password.dart';
import 'package:to_do/screens/auth/login.dart';
import 'package:to_do/screens/auth/register.dart';
import 'package:to_do/screens/home/home.dart';
import 'package:to_do/screens/splash/get_started.dart';
import 'package:to_do/screens/splash/splash.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/get-started':
        return MaterialPageRoute(builder: (_) => const GetStarted());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        throw ('This route name does not exit');
    }
  }
}
