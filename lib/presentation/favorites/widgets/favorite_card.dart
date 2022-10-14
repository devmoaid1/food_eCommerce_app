import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/data/models/product.dart';

import '../../../core/theme/colors.dart';

class FavoriteCard extends StatelessWidget {
  final Product product;
  const FavoriteCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: 60.w, height: 60.h, color: AppColors.addressCardColor),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Pieces ${product.stock}",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    "\$ ${product.currentPrice}",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "\$ ${product.originalPrice}",
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
