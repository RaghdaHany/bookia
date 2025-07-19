import 'package:bookia/features/auth/presentation/page/login_screen.dart';
import 'package:bookia/features/auth/presentation/page/register_screen.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/pages/book_details_screen.dart';
import 'package:bookia/features/intro/splash_screen.dart';
import 'package:bookia/features/intro/welcome_screen.dart';
import 'package:bookia/features/main/main_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String bookDetails = '/bookDetails';

  static final routers = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: register, builder: (context, state) => registerScreen()),
      GoRoute(path: main, builder: (context, state) => MainScreen()),
      GoRoute(
        path: bookDetails,
        builder:
            (context, state) =>
                BookDetailsScreen(product: state.extra as Product),
      ),
    ],
  );
}
