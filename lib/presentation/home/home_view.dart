import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_app/core/theme/colors.dart';
import 'package:flutter_task_app/presentation/home/widgets/address_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/categories_section.dart';
import 'package:flutter_task_app/presentation/home/widgets/deals_section.dart';

import '../../core/assets/icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // app bar
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(100)),
                          shape: BoxShape.rectangle),
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
                              fontFamily: "Poppins",
                              fontSize: 11.sp,
                            ),
                          )),
                        ],
                      )),
                  Container(
                    width: 34.w,
                    height: 34.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.disabledColor, width: 1)),
                  )
                ],
              ),
            ),

            // search
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.searchBarBorderColor, width: 1),
                  color: AppColors.searchBarFillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "search in thousands for products",
                      style: TextStyle(fontSize: 11.sp, fontFamily: "poppins"),
                    )
                  ],
                ),
              ),
            )),

            // address
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                      flex: 1,
                      child: ArddressCard(
                          addressFloor: "Street x12",
                          addressStreet: "Mustafa St. No:2",
                          addressTitle: "Home Address")),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Expanded(
                      flex: 1,
                      child: ArddressCard(
                          addressFloor: "Floor 2, Office 11",
                          addressStreet: "Axis Istanbul, B2 Blok",
                          addressTitle: "Office Address"))
                ],
              ),
            )),

            // main sections

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // categories section

                    const CategoriesSection(),

                    //deals Section
                    const DealsSection(),

                    Container(
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
                                        fontSize: 11.sp,
                                        color: Theme.of(context).primaryColor),
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
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      Text(
                                        "\$ 18",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationThickness: 2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "* Available until 24 December 2020",
                                    style: TextStyle(
                                        fontSize: 9.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  final Color color;

  CustomShape({required this.color});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    var firstStart = Offset(size.width / 2, size.height / 2);
    var firstEnd = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstStart.dy);

    // path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
