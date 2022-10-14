import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../data/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: 56.w, height: 56.w, color: AppColors.addressCardColor),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            category.name ?? "category",
            style: TextStyle(fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
