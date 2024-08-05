import 'package:get/get.dart';
import 'package:team_tap_app/screens/farms/all_collects_screen.dart';
import 'package:team_tap_app/screens/farms/collect_screen.dart';
import 'package:team_tap_app/screens/splash_screen.dart';
import 'package:team_tap_app/screens/auth/login_screen.dart';
import 'package:team_tap_app/screens/dashboard_screen.dart';
import 'package:team_tap_app/screens/layout_screen.dart';
import 'package:team_tap_app/screens/farms/register_worker_screen.dart';

appRoutes() => [
      GetPage(
        name: '/splash',
        page: () => SplashScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/layout',
        page: () => LayoutScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/home',
        page: () => DashboardScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/registerw',
        page: () => RegisterWorkerScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/collect',
        page: () => CollectScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/collectslist',
        page: () => AllCollectsScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
