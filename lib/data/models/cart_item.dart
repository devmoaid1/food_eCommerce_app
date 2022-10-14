import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/data/models/product.dart';

class CartItem extends Equatable {
  final int? quantity;
  final double? totalPrice;
  final Product? product;

  const CartItem({this.quantity, this.totalPrice, this.product});

  @override
  List<Object?> get props => [quantity, totalPrice, product];
}
