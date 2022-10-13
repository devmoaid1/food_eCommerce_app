import 'package:flutter_task_app/presentation/main_navigation/main_navigation_view.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";

  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainNavigationView()),
  ];
}
