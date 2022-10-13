import 'package:flutter_task_app/presentation/main_navigation/main_navigation_viewmodel.dart';
import 'package:get/get.dart';

void setupLocator() {
  Get.lazyPut(() => MainNavigationViewModel());
}
