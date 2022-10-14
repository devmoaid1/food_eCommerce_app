import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_app/presentation/cart/cart_view.dart';
import 'package:flutter_task_app/presentation/favorites/favorites_view.dart';
import 'package:flutter_task_app/presentation/home/home_view.dart';
import 'package:flutter_task_app/presentation/main_navigation/main_navigation_viewmodel.dart';
import 'package:flutter_task_app/presentation/main_navigation/widgets/bottom_navigation.dart';
import 'package:flutter_task_app/presentation/news/news_view.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainNavigationViewModel>(
        builder: (controller) => Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: PageTransitionSwitcher(
              reverse: true,
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child);
              },
              child: getView(controller.currentIndex.value),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget getView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const NewsView();
      case 2:
        return const FavoritesView();
      case 3:
        return const CartView();

      default:
        return const HomeView();
    }
  }
}
