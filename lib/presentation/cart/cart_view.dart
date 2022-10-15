import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_app/core/widgets/No_data_indicator.dart';
import 'package:flutter_task_app/presentation/cart/cart_viewmodel.dart';
import 'package:flutter_task_app/presentation/cart/widgets/cart_item_card.dart';
import 'package:flutter_task_app/presentation/home/widgets/header_card.dart';
import 'package:get/get.dart';

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
            GetBuilder<CartViewModel>(builder: (controller) {
              return controller.cart.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.cart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final cartItem = controller.cart[index];
                          return CartItemCard(
                            cartItem: cartItem,
                            cartViewModel: controller,
                          );
                        },
                      ),
                    )
                  : const Expanded(
                      child: NoDataIndicator(
                      message: "Cart is Empty",
                    ));
            })
          ],
        ),
      ),
    );
  }
}
