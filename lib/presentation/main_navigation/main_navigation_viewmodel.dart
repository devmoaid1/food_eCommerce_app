import 'package:get/get.dart';

class MainNavigationViewModel extends GetxController {
  final RxInt _index = 0.obs;

  RxInt get currentIndex => _index;

  void setIndex(int index) {
    _index.value = index;
    update();
  }
}
