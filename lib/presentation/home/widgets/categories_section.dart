import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/presentation/home/home_viewmodel.dart';
import 'package:flutter_task_app/presentation/home/widgets/category_card.dart';

import '../../../core/theme/colors.dart';

class CategoriesSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CategoriesSection({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore By Category",
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              "See All (${homeViewModel.categories.isNotEmpty ? homeViewModel.categories.length : 9})",
              style: TextStyle(
                  fontSize: 9.sp, color: AppColors.secondaryTextColor),
            )
          ],
        ),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            itemCount: homeViewModel.categories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemBuilder: (context, index) {
              return CategoryCard(category: homeViewModel.categories[index]);
            },
          ),
        )
      ],
    );
  }
}
