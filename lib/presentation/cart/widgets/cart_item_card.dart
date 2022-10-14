import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/data/models/cart_item.dart';

import '../../../core/theme/colors.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 56.w,
                height: 56.h,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product!.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColors.offerBannerTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Pieces ${cartItem.product!.stock}",
                  style: TextStyle(
                      color: AppColors.cartDetailsTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 9.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "\$ ${cartItem.totalPrice}",
                  style: TextStyle(
                      fontSize: 18.sp, color: AppColors.cartPriceTextColor),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 33.w,
                      height: 33.w,
                      color: AppColors.quantityCardColor,
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.addIconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    cartItem.quantity.toString(),
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 33.w,
                      height: 33.w,
                      color: AppColors.quantityCardColor,
                      child: const Icon(
                        Icons.add,
                        color: AppColors.addIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
