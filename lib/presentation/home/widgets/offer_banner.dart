import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({
    Key? key,
  }) : super(key: key);

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
            Container(
              width: (constraints.biggest.width / 2) - 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mega",
                    style: TextStyle(
                        fontSize: 11.sp, color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "Whopper".toUpperCase(),
                    style: TextStyle(
                        fontSize: 31.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.offerBannerTextColor),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ 12",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        "\$ 18",
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
                    "* Available until 24 December 2020",
                    style: TextStyle(fontSize: 9.sp, color: Colors.white),
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
