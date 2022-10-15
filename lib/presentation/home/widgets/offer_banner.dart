import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../data/models/offer.dart';

class OfferBanner extends StatelessWidget {
  final Offer offer;
  const OfferBanner({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.offerBannerColor,
          borderRadius: BorderRadius.circular(10)),
      height: 131.h,
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: (constraints.biggest.width / 2) - 20.w,
              child: Image.asset(offer.product!.imagePath!, fit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.product!.name!.split(" ")[0],
                    style: TextStyle(
                        fontSize: 11.sp, color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    offer.product!.name!.split(" ")[1].toUpperCase(),
                    style: TextStyle(
                        fontSize: 31.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.offerBannerTextColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${offer.product!.currentPrice}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        "\$${offer.product!.originalPrice}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "* Available until ${offer.dueDate}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 9.sp,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
