import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/presentation/favorites/favorites_viewmodel.dart';
import 'package:flutter_task_app/presentation/favorites/widgets/favorite_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/header_card.dart';
import 'package:get/get.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderCard(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Favorites",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            GetBuilder<FavoritesViewModel>(builder: ((controller) {
              return controller.favorites.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        key: UniqueKey(),
                        shrinkWrap: true,
                        itemCount: controller.favorites.length,
                        itemBuilder: (context, index) {
                          final product = controller.favorites[index];
                          return FavoriteCard(
                            product: product,
                            key: UniqueKey(),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          "No Favorites at the moment",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
            }))
          ],
        ),
      ),
    );
  }
}
