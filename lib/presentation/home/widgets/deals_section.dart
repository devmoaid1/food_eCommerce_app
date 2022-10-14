import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/assets/icons.dart';
import '../../../core/theme/colors.dart';

class DealsSection extends StatelessWidget {
  const DealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deals of the day ",
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: 4,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
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
                          "Summer Sun Ice Cream Pack",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Pieces 5",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.pinLocationIcon,
                              height: 12.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "15 Minutes Away",
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
                              "\$ 12",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "\$ 18",
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
            },
          ),
        )
      ],
    );
  }
}
