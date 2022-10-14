import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class ArddressCard extends StatelessWidget {
  final String addressTitle;
  final String addressStreet;
  final String addressFloor;
  const ArddressCard(
      {super.key,
      required this.addressFloor,
      required this.addressStreet,
      required this.addressTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.searchBarBorderColor, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: 39.w, height: 38.h, color: AppColors.addressCardColor),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressTitle,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                addressStreet,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
              Text(
                addressFloor,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
