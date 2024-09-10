import 'package:go_router/go_router.dart';
import 'package:flutter_arms/features/home/presentation/pages/home_page.dart';
import 'package:flutter_arms/features/splash/presentation/pages/splash_page.dart';
import '../features/login/presentation/pages/login_page.dart';

class AppRoutes{
  AppRoutes._();
  static const String splash = "/";
  static const String login = "/login";
  static const String home = "/home";
}

final router = GoRouter(routes: [
  GoRoute(path: AppRoutes.splash,builder: (context,state) => const SplashPage()),

  GoRoute(path: AppRoutes.login,builder: (context,state) => const LoginPage()),

  GoRoute(path: AppRoutes.home,builder: (context,state) => const HomePage()),
]);