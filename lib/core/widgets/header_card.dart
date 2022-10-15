import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_app/presentation/home/home_view.dart';

import '../../../core/assets/icons.dart';
import '../../../core/theme/colors.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: UniqueKey(),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
              width: 122.w,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    height: 18.h,
                    AppIcons.pinLocationIcon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Center(
                      child: Text(
                    "Oxford st",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  )),
                ],
              )),
        ),
        Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: AppColors.disabledColor, width: 1)),
        )
      ],
    );
  }
}
