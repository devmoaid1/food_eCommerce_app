import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

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
              "See All (36)",
              style: TextStyle(
                  fontSize: 9.sp, color: AppColors.secondaryTextColor),
            )
          ],
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          width: 56.w,
                          height: 56.w,
                          color: AppColors.addressCardColor),
                    ),
                    Text(
                      "Steak",
                      style: TextStyle(fontSize: 9.sp),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
