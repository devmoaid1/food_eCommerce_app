// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/data/models/address.dart';
import 'package:flutter_task_app/presentation/home/home_viewmodel.dart';
import 'package:flutter_task_app/presentation/home/widgets/address_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/categories_section.dart';
import 'package:flutter_task_app/presentation/home/widgets/deals_section.dart';

import 'package:flutter_task_app/presentation/home/widgets/search_card.dart';
import 'package:get/get.dart';

import '../../core/widgets/header_card.dart';
import 'widgets/offer_banner.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            const SliverToBoxAdapter(child: HeaderCard()),

            // search
            const SliverToBoxAdapter(child: SearchCard()),

            // main sections

            SliverToBoxAdapter(
                child: GetBuilder<HomeViewModel>(builder: ((controller) {
              return Obx((() {
                if (controller.isLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                        backgroundColor: Theme.of(context).primaryColor),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // categories section

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: ArddressCard(
                                  address: controller.addresses.isNotEmpty
                                      ? controller.addresses[0]
                                      : const Address(
                                          type: "home",
                                          street: "Street x12",
                                          title: "Mustafa St. No:2",
                                        ),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                flex: 1,
                                child: ArddressCard(
                                    address: controller.addresses.isNotEmpty
                                        ? controller.addresses[1]
                                        : const Address(
                                            type: "office",
                                            floor: "Floor 2, Office 11",
                                            street: "Street x12",
                                            title: "Axis Istanbul, B2 Blok",
                                          )))
                          ],
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        CategoriesSection(
                          homeViewModel: controller,
                        ),

                        //deals Section
                        DealsSection(homeViewModel: controller),

                        controller.currentOffer != null
                            ? OfferBanner(
                                offer: controller.currentOffer!,
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                      ],
                    ),
                  );
                }
              }));
            })))
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
