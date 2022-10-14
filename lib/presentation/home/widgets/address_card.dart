import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/data/models/address.dart';

import '../../../core/theme/colors.dart';

class ArddressCard extends StatelessWidget {
  final Address address;
  // final String addressTitle;
  // final String addressStreet;
  // final String addressFloor;
  const ArddressCard({super.key, required this.address});

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
                address.type == "home" ? "Home Address" : "Office Address",
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                address.title ?? "",
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
              Text(
                address.type == "home"
                    ? address.street ?? ""
                    : address.floor ?? "",
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
