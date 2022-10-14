import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/assets/icons.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/deal.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  const DealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width * 0.65,
      margin: EdgeInsets.only(right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    width: 90.w,
                    height: 90.w,
                    color: AppColors.addressCardColor),
              ),
              Positioned(
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.favoritesFilledIcon,
                      color: Theme.of(context).primaryColor,
                      height: 11.h,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deal.product!.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Pieces ${deal.product!.stock}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.pinLocationIcon,
                    height: 14.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${deal.distance} Minutes Away",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    "\$ ${deal.product!.currentPrice}",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "\$ ${deal.product!.originalPrice}",
                    style: TextStyle(
                        color: AppColors.disabledColor,
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
