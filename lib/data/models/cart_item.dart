import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/data/models/product.dart';

class CartItem extends Equatable {
  int? quantity;
  double? totalPrice;
  final Product? product;

  CartItem({this.quantity, this.totalPrice, this.product});

  @override
  List<Object?> get props => [quantity, totalPrice, product];
}
