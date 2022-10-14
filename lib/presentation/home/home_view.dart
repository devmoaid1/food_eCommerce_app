import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/core/theme/colors.dart';
import 'package:flutter_task_app/data/models/address.dart';
import 'package:flutter_task_app/presentation/home/widgets/address_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/categories_section.dart';
import 'package:flutter_task_app/presentation/home/widgets/deals_section.dart';
import 'package:flutter_task_app/presentation/home/widgets/header_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/search_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // app bar
            const SliverToBoxAdapter(child: HeaderCard()),

            // search
            const SliverToBoxAdapter(child: SearchCard()),

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
                        address: Address(
                          type: "home",
                          street: "Street x12",
                          title: "Mustafa St. No:2",
                        ),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Expanded(
                      flex: 1,
                      child: ArddressCard(
                          address: Address(
                        type: "office",
                        floor: "Floor 2, Office 11",
                        street: "Street x12",
                        title: "Axis Istanbul, B2 Blok",
                      )))
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
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addPolygon([
      const Offset(0, 0),
      Offset(size.width / 2 + 20, 0),
      // Offset(size.width + 100, size.height),
      Offset(size.width, size.height),
      Offset(0, size.height),
    ], true);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
