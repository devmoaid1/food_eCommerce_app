import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/presentation/home/home_viewmodel.dart';
import 'package:flutter_task_app/presentation/home/widgets/deal_card.dart';

class DealsSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const DealsSection({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deals of the day ",
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: homeViewModel.currentDeals.length,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final deal = homeViewModel.currentDeals[index];
              bool isExistInFav =
                  homeViewModel.isItemInFavorites(deal.product!);

              return DealCard(
                deal: homeViewModel.currentDeals[index],
                homeViewModel: homeViewModel,
                isExist: isExistInFav,
                key: UniqueKey(),
              );
            },
          ),
        )
      ],
    );
  }
}
