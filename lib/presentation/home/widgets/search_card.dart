import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.searchBarBorderColor, width: 1),
          color: AppColors.searchBarFillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "search in thousands for products",
              style: TextStyle(fontSize: 11.sp, fontFamily: "poppins"),
            )
          ],
        ),
      ),
    );
  }
}
