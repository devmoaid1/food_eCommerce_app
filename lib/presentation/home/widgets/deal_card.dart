import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_app/presentation/home/home_viewmodel.dart';
import 'package:get/get.dart';

import '../../../core/assets/icons.dart';
import '../../../core/theme/colors.dart';
import '../../../data/models/deal.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  final bool isExist;
  final HomeViewModel homeViewModel;
  const DealCard(
      {super.key,
      required this.deal,
      required this.isExist,
      required this.homeViewModel});

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
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 90.w,
                  height: 90.w,
                  color: AppColors.addressCardColor,
                  child: Image.asset(
                    deal.product!.imagePath!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    if (!isExist) {
                      homeViewModel.addItemToFavorites(deal.product!);
                    } else {
                      homeViewModel.removeItemFromFavorites(deal.product!);
                    }
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        isExist
                            ? AppIcons.favoritesFilledIcon
                            : AppIcons.favoritesIcon,
                        color: isExist
                            ? Theme.of(context).primaryColor
                            : AppColors.disabledColor,
                        height: 11.h,
                      ),
                    ),
                  ),
                ),
              ),
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
                    width: 8.w,
                  ),
                  Text(
                    "\$ ${deal.product!.originalPrice}",
                    style: TextStyle(
                        color: AppColors.disabledColor,
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => homeViewModel.addToCart(deal.product!),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    fontSize: 13.sp,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
