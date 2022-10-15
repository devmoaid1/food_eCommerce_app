import 'package:flutter/material.dart';
import 'package:flutter_task_app/core/assets/icons.dart';
import 'package:flutter_task_app/core/theme/colors.dart';
import 'package:flutter_task_app/presentation/main_navigation/main_navigation_viewmodel.dart';
import 'package:flutter_task_app/presentation/main_navigation/widgets/nav_icon.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationViewModel>(
      builder: (controller) => Container(
        color: AppColors.bottomNavigationColor,
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          elevation: 2,
          onTap: (value) => controller.setIndex(value),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: AppColors.disabledColor,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                label: "Grocery",
                icon: NavIcon(
                    iconPath: AppIcons.grocereriesIcon,
                    itemIndex: 0,
                    activeIndex: controller.currentIndex.value)),
            BottomNavigationBarItem(
                label: "News",
                icon: NavIcon(
                    iconPath: AppIcons.newsIcon,
                    itemIndex: 1,
                    activeIndex: controller.currentIndex.value)),
            BottomNavigationBarItem(
                label: "Favorites",
                icon: NavIcon(
                    iconPath: AppIcons.favoritesIcon,
                    itemIndex: 2,
                    activeIndex: controller.currentIndex.value)),
            BottomNavigationBarItem(
                label: "Cart",
                icon: NavIcon(
                    iconPath: AppIcons.cartIcon,
                    itemIndex: 3,
                    activeIndex: controller.currentIndex.value)),
          ],
        ),
      ),
    );
  }
}
