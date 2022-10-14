import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/core/theme/colors.dart';
import 'package:flutter_task_app/data/models/cart_item.dart';
import 'package:flutter_task_app/data/models/product.dart';
import 'package:flutter_task_app/presentation/cart/widgets/cart_item_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/header_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderCard(),
            SizedBox(
              height: 30.h,
            ),
            const Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const CartItemCard(
                      cartItem: CartItem(
                          totalPrice: 25,
                          quantity: 1,
                          product: Product(
                              name: "salmon",
                              currentPrice: 25,
                              id: 1,
                              imagePath: "",
                              originalPrice: 30,
                              stock: 10)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
