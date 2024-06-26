part of 'navigation.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Future<dynamic> navigateTo(String routeName,
      {Map<String, dynamic>? arguments, bool clean = false}) {
    if (!clean) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.LOGIN:
        // Access the arguments from the map
        // final description = (settings.arguments as Map<String, dynamic>)['description'];

        // Uncomment the following lines if you want to pass arguments to the LoginView
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case AppRoute.HOME:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(builder: (_) => App());
    }
  }
}
